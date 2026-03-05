import '../entities/wallet_summary.dart';

abstract class WalletRepository {
  Future<WalletSummary> fetchSummary();
  Future<void> requestWithdrawal({required double amount, String? note});
}
