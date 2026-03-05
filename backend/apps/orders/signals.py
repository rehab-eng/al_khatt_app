from django.db.models.signals import post_save
from django.dispatch import receiver

from accounts.models import DeviceToken, UserRole
from accounts.services.firebase_messaging import send_notification
from fleet.models import Truck

from .models import MaterialType, Order


@receiver(post_save, sender=Order)
def notify_drivers_on_new_order(sender, instance, created, **kwargs):
    if not created:
        return
    if instance.material_type not in {MaterialType.SAND, MaterialType.MARBLE}:
        return

    driver_ids = (
        Truck.objects.filter(
            is_active=True,
            capacity_m3__gte=instance.quantity_m3,
            driver__role=UserRole.DRIVER,
        )
        .values_list('driver_id', flat=True)
        .distinct()
    )

    tokens = DeviceToken.objects.filter(user_id__in=driver_ids).values_list('token', flat=True)
    if not tokens:
        return

    title = 'طلب جديد متاح'
    body = f'طلب {instance.get_material_type_display()} بكمية {instance.quantity_m3} م³'
    send_notification(tokens, title, body, data={'order_id': str(instance.id)})
