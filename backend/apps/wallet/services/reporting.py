from datetime import timedelta
from io import BytesIO
from decimal import Decimal

from django.utils import timezone
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas

from orders.models import Order
from ..models import JournalEntry, JournalLine


def _week_bounds(now):
    start = now - timedelta(days=now.weekday())
    start = start.replace(hour=0, minute=0, second=0, microsecond=0)
    end = start + timedelta(days=7)
    return start, end


def generate_weekly_driver_report(driver, start_date=None, end_date=None):
    now = timezone.now()
    start_date = start_date or _week_bounds(now)[0]
    end_date = end_date or _week_bounds(now)[1]

    orders = Order.objects.filter(
        driver=driver,
        status=Order.Status.DELIVERED,
        delivered_at__gte=start_date,
        delivered_at__lt=end_date,
    )

    wallet_account = getattr(driver, 'wallet', None)
    account = wallet_account.ledger_account if wallet_account else None

    lines = JournalLine.objects.filter(
        account=account,
        entry__created_at__gte=start_date,
        entry__created_at__lt=end_date,
        entry__status=JournalEntry.Status.POSTED,
    ) if account else JournalLine.objects.none()

    total_trips = orders.count()
    total_amount = sum((line.amount for line in lines), Decimal('0'))

    buffer = BytesIO()
    pdf = canvas.Canvas(buffer, pagesize=A4)
    pdf.setTitle('Weekly Driver Settlement')

    pdf.setFont('Helvetica-Bold', 16)
    pdf.drawString(40, 800, 'Al-Khatt Logistics - Weekly Settlement')

    pdf.setFont('Helvetica', 12)
    pdf.drawString(40, 770, f'Driver: {driver.full_name or driver.phone}')
    pdf.drawString(40, 752, f'Period: {start_date.date()} to {end_date.date()}')

    pdf.drawString(40, 720, f'Total Trips: {total_trips}')
    pdf.drawString(40, 702, f'Wallet Movements: {total_amount}')

    pdf.drawString(40, 670, 'Orders:')
    y = 650
    for order in orders[:20]:
        pdf.drawString(50, y, f'- {order.id} | {order.material_type} | {order.quantity_m3} m3')
        y -= 16
        if y < 80:
            pdf.showPage()
            y = 800

    pdf.showPage()
    pdf.save()
    buffer.seek(0)
    return buffer.getvalue()



