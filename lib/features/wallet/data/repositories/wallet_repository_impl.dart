import '../../domain/entities/wallet_summary.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../datasources/wallet_remote_datasource.dart';
import '../models/wallet_summary_model.dart';

class WalletRepositoryImpl implements WalletRepository {
  WalletRepositoryImpl(this.remoteDataSource);

  final WalletRemoteDataSource remoteDataSource;

  @override
  Future<WalletSummary> fetchSummary() async {
    final data = await remoteDataSource.fetchSummary();
    return WalletSummaryModel.fromMap(data);
  }

  @override
  Future<void> requestWithdrawal({required double amount, String? note}) {
    return remoteDataSource.requestWithdrawal(amount: amount, note: note);
  }
}
