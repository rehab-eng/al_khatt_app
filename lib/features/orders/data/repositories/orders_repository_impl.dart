import '../../domain/entities/orders_summary.dart';
import '../../domain/repositories/orders_repository.dart';
import '../datasources/orders_remote_datasource.dart';
import '../models/orders_summary_model.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  OrdersRepositoryImpl(this.remoteDataSource);

  final OrdersRemoteDataSource remoteDataSource;

  @override
  Future<OrdersSummary> fetchOrders() async {
    final data = await remoteDataSource.fetchOrders();
    return OrdersSummaryModel.fromMap(data);
  }
}
