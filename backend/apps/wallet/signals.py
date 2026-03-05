from django.db.models.signals import post_save
from django.dispatch import receiver

from accounts.models import User
from .models import AccountScope, AccountType, LedgerAccount, Wallet


@receiver(post_save, sender=User)
def create_wallet_for_user(sender, instance, created, **kwargs):
    if not created:
        return
    account = LedgerAccount.objects.create(
        owner=instance,
        scope=AccountScope.USER,
        name=f'Wallet {instance.phone}',
        code=f'WAL-{instance.id.hex[:8]}',
        account_type=AccountType.ASSET,
        currency='LYD',
    )
    Wallet.objects.create(owner=instance, ledger_account=account, currency='LYD')



