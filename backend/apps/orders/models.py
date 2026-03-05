import uuid

from django.conf import settings
from django.core.exceptions import ValidationError
from django.db import models
from django.utils import timezone

GIS_ENABLED = getattr(settings, 'GIS_ENABLED', True)
gis_models = None
if GIS_ENABLED:
    try:
        from django.contrib.gis.db import models as gis_models
    except Exception:
        gis_models = None


class MaterialType(models.TextChoices):
    SAND = 'sand', 'Sand'
    GRAVEL = 'gravel', 'Gravel'
    CRUSHED = 'crushed', 'Crushed Stone'
    MARBLE = 'marble', 'Marble'
    STEEL = 'steel', 'Steel'


class Order(models.Model):
    class Status(models.TextChoices):
        PENDING = 'pending', 'Pending'
        ASSIGNED = 'assigned', 'Assigned'
        IN_TRANSIT = 'in_transit', 'In Transit'
        DELIVERED = 'delivered', 'Delivered'
        CANCELLED = 'cancelled', 'Cancelled'

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    contractor = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.PROTECT,
        related_name='orders_created',
    )
    driver = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.PROTECT,
        null=True,
        blank=True,
        related_name='orders_driven',
    )
    agent = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.PROTECT,
        null=True,
        blank=True,
        related_name='orders_managed',
    )
    material_type = models.CharField(max_length=20, choices=MaterialType.choices)
    quantity_m3 = models.DecimalField(max_digits=10, decimal_places=2)
    status = models.CharField(max_length=20, choices=Status.choices, default=Status.PENDING)
    if gis_models:
        pickup_location = gis_models.PointField(null=True, blank=True)
        delivery_location = gis_models.PointField(null=True, blank=True)
    else:
        pickup_lat = models.FloatField(null=True, blank=True)
        pickup_lng = models.FloatField(null=True, blank=True)
        delivery_lat = models.FloatField(null=True, blank=True)
        delivery_lng = models.FloatField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    delivered_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        ordering = ['-created_at']

    def mark_delivered(self):
        self.status = self.Status.DELIVERED
        self.delivered_at = timezone.now()
        self.save(update_fields=['status', 'delivered_at'])

    def save(self, *args, **kwargs):
        self.full_clean()
        return super().save(*args, **kwargs)

    def clean(self):
        from accounts.models import UserRole

        if self.contractor and self.contractor.role != UserRole.CONTRACTOR:
            raise ValidationError('Contractor must have contractor role.')
        if self.driver and self.driver.role != UserRole.DRIVER:
            raise ValidationError('Driver must have driver role.')
        if self.agent and self.agent.role != UserRole.AGENT:
            raise ValidationError('Agent must have agent role.')

    def __str__(self):
        return f'Order {self.id}'
