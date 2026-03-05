import '../../../../core/constants/app_endpoints.dart';
import '../../../../core/network/dio_client.dart';

class ProfileRemoteDataSource {
  ProfileRemoteDataSource(this.client);
  final DioClient client;

  Future<Map<String, dynamic>> fetchProfile() async {
    final response = await client.get<Map<String, dynamic>>(AppEndpoints.authProfile);
    return response.data ?? <String, dynamic>{};
  }
}
