from django import template

from accounts.models import DriverProfile
from wallet.models import JournalEntry

register = template.Library()


@register.simple_tag
def pending_withdrawals_count():
    return JournalEntry.objects.filter(
        status=JournalEntry.Status.PENDING,
        reference_type='withdrawal',
    ).count()


@register.simple_tag
def pending_driver_docs_count():
    return DriverProfile.objects.filter(license_status='pending').count()
