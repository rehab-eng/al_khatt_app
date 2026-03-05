import '../entities/orders_summary.dart';

abstract class OrdersRepository {
  Future<OrdersSummary> fetchOrders();
}
