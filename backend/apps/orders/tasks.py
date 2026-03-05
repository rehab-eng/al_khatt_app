from celery import shared_task
from django.db import transaction

from .models import Order


@shared_task
def process_order_request(order_id):
    with transaction.atomic():
        order = Order.objects.select_for_update().get(id=order_id)
        if order.status != Order.Status.PENDING:
            return str(order.status)
        order.status = Order.Status.ASSIGNED
        order.save(update_fields=['status', 'updated_at'])
        return 'assigned'



