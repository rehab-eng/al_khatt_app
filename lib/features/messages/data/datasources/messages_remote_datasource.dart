import '../../../../core/constants/app_endpoints.dart';
import '../../../../core/network/dio_client.dart';

class MessagesRemoteDataSource {
  MessagesRemoteDataSource(this.client);
  final DioClient client;

  Future<List<dynamic>> fetchThreads() async {
    final response = await client.get<List<dynamic>>(AppEndpoints.messageThreads);
    return response.data ?? const [];
  }
}
