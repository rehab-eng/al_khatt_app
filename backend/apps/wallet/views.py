from decimal import Decimal

from django.db.models import Sum
from django.db.models.functions import Coalesce
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from .models import AccountType, JournalEntry, JournalLine, Wallet
from .serializers import WalletSummarySerializer
from .services.ledger import get_or_create_system_account, request_withdrawal


class WalletSummaryView(APIView):
    def get(self, request):
        wallet = Wallet.objects.select_related('ledger_account').get(owner=request.user)
        lines = (
            JournalLine.objects.filter(account=wallet.ledger_account)
            .select_related('entry')
            .order_by('-entry__created_at')[:20]
        )
        payload = {
            'wallet': wallet,
            'transactions': lines,
        }
        serializer = WalletSummarySerializer(payload)
        return Response(serializer.data)


class WalletWithdrawalView(APIView):
    def post(self, request):
        amount = Decimal(str(request.data.get('amount', '0')))
        note = request.data.get('note', '')
        if amount <= 0:
            return Response({'detail': 'Invalid amount'}, status=status.HTTP_400_BAD_REQUEST)

        wallet = Wallet.objects.select_related('ledger_account').get(owner=request.user)
        pending_withdrawals = (
            JournalLine.objects.filter(
                account=wallet.ledger_account,
                direction=JournalLine.Direction.CREDIT,
                entry__status=JournalEntry.Status.PENDING,
                entry__reference_type='withdrawal',
            ).aggregate(total=Coalesce(Sum('amount'), Decimal('0')))['total']
            or Decimal('0')
        )
        available_balance = wallet.balance - pending_withdrawals
        if available_balance < amount:
            return Response({'detail': 'Insufficient balance'}, status=status.HTTP_400_BAD_REQUEST)

        hold_account = get_or_create_system_account(
            code='SYS-WITHDRAW-HOLD',
            name='Withdrawals Hold',
            account_type=AccountType.ASSET,
        )

        entry = request_withdrawal(
            memo=note or 'Withdrawal Request',
            created_by=request.user,
            reference_type='withdrawal',
            reference_id=str(wallet.id),
            lines=[
                {
                    'account': hold_account,
                    'direction': JournalLine.Direction.DEBIT,
                    'amount': amount,
                },
                {
                    'account': wallet.ledger_account,
                    'direction': JournalLine.Direction.CREDIT,
                    'amount': amount,
                },
            ],
        )

        return Response({'id': str(entry.id), 'status': entry.status}, status=status.HTTP_201_CREATED)
