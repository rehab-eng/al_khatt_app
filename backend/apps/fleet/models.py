import uuid

from django.conf import settings
from django.db import models


class VehicleType(models.TextChoices):
    SMALL = 'truck_small', 'Small Truck'
    MEDIUM = 'truck_medium', 'Medium Truck'
    LARGE = 'truck_large', 'Large Truck'


class Truck(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    driver = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.PROTECT,
        related_name='trucks',
    )
    name = models.CharField(max_length=80, blank=True)
    plate_number = models.CharField(max_length=20, unique=True)
    vehicle_type = models.CharField(max_length=20, choices=VehicleType.choices, blank=True)
    is_registered_owner = models.BooleanField(default=True)
    registration_reason = models.CharField(max_length=200, blank=True)
    trailer_number = models.CharField(max_length=40, blank=True)
    capacity_m3 = models.DecimalField(max_digits=8, decimal_places=2)
    max_load_tons = models.DecimalField(max_digits=8, decimal_places=2, null=True, blank=True)
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return f'{self.plate_number} ({self.capacity_m3} m3)'

    def clean(self):
        from accounts.models import UserRole
        from django.core.exceptions import ValidationError

        if self.driver and self.driver.role != UserRole.DRIVER:
            raise ValidationError('Assigned driver must have driver role.')

    def save(self, *args, **kwargs):
        self.full_clean()
        return super().save(*args, **kwargs)



