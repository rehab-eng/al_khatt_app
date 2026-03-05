from decimal import Decimal

from django.core.exceptions import ValidationError
from django.db import transaction

from ..models import AccountScope, AccountType, JournalEntry, JournalLine, LedgerAccount


def post_entry(*, memo, created_by=None, reference_type='', reference_id='', lines=None, status=JournalEntry.Status.POSTED):
    if not lines or len(lines) < 2:
        raise ValidationError('At least two journal lines are required.')

    total_debit = Decimal('0')
    total_credit = Decimal('0')

    for line in lines:
        amount = Decimal(str(line['amount']))
        if amount <= 0:
            raise ValidationError('Amounts must be positive.')
        if line['direction'] == JournalLine.Direction.DEBIT:
            total_debit += amount
        elif line['direction'] == JournalLine.Direction.CREDIT:
            total_credit += amount
        else:
            raise ValidationError('Invalid direction value.')

    if total_debit != total_credit:
        raise ValidationError('Entry is not balanced.')

    with transaction.atomic():
        entry = JournalEntry.objects.create(
            memo=memo,
            created_by=created_by,
            reference_type=reference_type,
            reference_id=reference_id,
            status=status,
        )
        JournalLine.objects.bulk_create(
            [
                JournalLine(
                    entry=entry,
                    account=line['account'],
                    direction=line['direction'],
                    amount=Decimal(str(line['amount'])),
                )
                for line in lines
            ]
        )
        return entry


def request_withdrawal(*, memo, created_by=None, reference_type='', reference_id='', lines=None):
    return post_entry(
        memo=memo,
        created_by=created_by,
        reference_type=reference_type,
        reference_id=reference_id,
        lines=lines,
        status=JournalEntry.Status.PENDING,
    )


def get_or_create_system_account(*, code, name, account_type):
    account, _ = LedgerAccount.objects.get_or_create(
        code=code,
        defaults={
            'name': name,
            'account_type': account_type,
            'scope': AccountScope.SYSTEM,
            'currency': 'LYD',
        },
    )
    return account
