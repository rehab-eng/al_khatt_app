import uuid
from decimal import Decimal

from django.conf import settings
from django.db import models
from django.db.models import Sum
from django.db.models.functions import Coalesce


class AccountType(models.TextChoices):
    ASSET = 'asset', 'Asset'
    LIABILITY = 'liability', 'Liability'
    EQUITY = 'equity', 'Equity'
    REVENUE = 'revenue', 'Revenue'
    EXPENSE = 'expense', 'Expense'


class AccountScope(models.TextChoices):
    SYSTEM = 'system', 'System'
    USER = 'user', 'User'


class LedgerAccount(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    owner = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        related_name='ledger_accounts',
    )
    scope = models.CharField(max_length=20, choices=AccountScope.choices, default=AccountScope.USER)
    name = models.CharField(max_length=120)
    code = models.CharField(max_length=40, unique=True)
    account_type = models.CharField(max_length=20, choices=AccountType.choices)
    currency = models.CharField(max_length=6, default='LYD')
    is_active = models.BooleanField(default=True)

    class Meta:
        indexes = [
            models.Index(fields=['owner', 'account_type']),
        ]

    def __str__(self):
        return f'{self.code} - {self.name}'

    @property
    def balance(self):
        totals = self.lines.aggregate(
            debit=Coalesce(
                Sum(
                    'amount',
                    filter=models.Q(
                        direction=JournalLine.Direction.DEBIT,
                        entry__status=JournalEntry.Status.POSTED,
                    ),
                ),
                Decimal('0'),
            ),
            credit=Coalesce(
                Sum(
                    'amount',
                    filter=models.Q(
                        direction=JournalLine.Direction.CREDIT,
                        entry__status=JournalEntry.Status.POSTED,
                    ),
                ),
                Decimal('0'),
            ),
        )
        debit = totals['debit']
        credit = totals['credit']
        if self.account_type in {AccountType.ASSET, AccountType.EXPENSE}:
            return debit - credit
        return credit - debit


class Wallet(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    owner = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name='wallet',
    )
    ledger_account = models.OneToOneField(LedgerAccount, on_delete=models.PROTECT, related_name='wallet')
    currency = models.CharField(max_length=6, default='LYD')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'Wallet {self.owner_id}'

    @property
    def balance(self):
        return self.ledger_account.balance


class JournalEntry(models.Model):
    class Status(models.TextChoices):
        PENDING = 'pending', 'Pending'
        POSTED = 'posted', 'Posted'
        REJECTED = 'rejected', 'Rejected'

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    memo = models.CharField(max_length=255, blank=True)
    reference_type = models.CharField(max_length=60, blank=True)
    reference_id = models.CharField(max_length=80, blank=True)
    status = models.CharField(
        max_length=12,
        choices=Status.choices,
        default=Status.POSTED,
    )
    created_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='journal_entries',
    )
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f'Entry {self.id}'


class JournalLine(models.Model):
    class Direction(models.TextChoices):
        DEBIT = 'debit', 'Debit'
        CREDIT = 'credit', 'Credit'

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    entry = models.ForeignKey(JournalEntry, on_delete=models.CASCADE, related_name='lines')
    account = models.ForeignKey(LedgerAccount, on_delete=models.PROTECT, related_name='lines')
    direction = models.CharField(max_length=10, choices=Direction.choices)
    amount = models.DecimalField(max_digits=18, decimal_places=2)

    class Meta:
        indexes = [
            models.Index(fields=['account', 'direction']),
        ]

    def __str__(self):
        return f'{self.account.code} {self.direction} {self.amount}'



