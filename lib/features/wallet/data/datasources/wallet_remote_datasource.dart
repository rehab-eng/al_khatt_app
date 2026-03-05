import '../../../../core/constants/app_endpoints.dart';
import '../../../../core/network/dio_client.dart';

class WalletRemoteDataSource {
  WalletRemoteDataSource(this.client);
  final DioClient client;

  Future<Map<String, dynamic>> fetchSummary() async {
    final response = await client.get<Map<String, dynamic>>(AppEndpoints.walletSummary);
    return response.data ?? <String, dynamic>{};
  }

  Future<void> requestWithdrawal({required double amount, String? note}) async {
    await client.post<void>(
      AppEndpoints.walletWithdrawals,
      data: {
        'amount': amount,
        'note': note,
      },
    );
  }
}
