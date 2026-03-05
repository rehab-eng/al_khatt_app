from django.urls import path

from .views import WalletSummaryView, WalletWithdrawalView

urlpatterns = [
    path('wallet/summary', WalletSummaryView.as_view(), name='wallet-summary'),
    path('wallet/withdrawals', WalletWithdrawalView.as_view(), name='wallet-withdrawals'),
]
