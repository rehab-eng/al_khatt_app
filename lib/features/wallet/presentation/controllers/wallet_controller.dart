import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/wallet_remote_datasource.dart';
import '../../data/repositories/wallet_repository_impl.dart';
import '../../domain/entities/wallet_summary.dart';
import '../../domain/repositories/wallet_repository.dart';

final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return WalletRepositoryImpl(WalletRemoteDataSource(client));
});

final walletSummaryProvider = FutureProvider.autoDispose<WalletSummary>((ref) {
  return ref.watch(walletRepositoryProvider).fetchSummary();
});

final walletActionsProvider = Provider<WalletActions>((ref) {
  return WalletActions(ref.watch(walletRepositoryProvider));
});

class WalletActions {
  WalletActions(this.repository);
  final WalletRepository repository;

  Future<void> requestWithdrawal({required double amount, String? note}) {
    return repository.requestWithdrawal(amount: amount, note: note);
  }
}
