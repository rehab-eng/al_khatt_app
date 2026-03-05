import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/orders_remote_datasource.dart';
import '../../data/repositories/orders_repository_impl.dart';
import '../../domain/entities/orders_summary.dart';
import '../../domain/repositories/orders_repository.dart';

final ordersRepositoryProvider = Provider<OrdersRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return OrdersRepositoryImpl(OrdersRemoteDataSource(client));
});

final ordersSummaryProvider = FutureProvider.autoDispose<OrdersSummary>((ref) {
  return ref.watch(ordersRepositoryProvider).fetchOrders();
});
