import '../../../../core/constants/app_endpoints.dart';
import '../../../../core/network/dio_client.dart';

class OrdersRemoteDataSource {
  OrdersRemoteDataSource(this.client);
  final DioClient client;

  Future<dynamic> fetchOrders() async {
    final response = await client.get<dynamic>(AppEndpoints.orders);
    return response.data;
  }
}
