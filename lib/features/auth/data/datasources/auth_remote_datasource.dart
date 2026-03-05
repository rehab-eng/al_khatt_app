import '../../../../core/constants/app_endpoints.dart';
import '../../../../core/network/dio_client.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource(this.client);

  final DioClient client;

  Future<void> requestOtp(String phone) async {
    await client.post<void>(
      AppEndpoints.authOtpRequest,
      data: {'phone': phone},
    );
  }

  Future<Map<String, dynamic>> verifyOtp(String phone, String code) async {
    final response = await client.post<Map<String, dynamic>>(
      AppEndpoints.authOtpVerify,
      data: {
        'phone': phone,
        'code': code,
      },
    );
    return response.data ?? <String, dynamic>{};
  }
}
