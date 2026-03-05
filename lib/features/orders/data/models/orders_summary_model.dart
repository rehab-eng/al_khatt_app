import '../../domain/entities/orders_summary.dart';

class OrderItemModel extends OrderItem {
  const OrderItemModel({
    required super.id,
    required super.material,
    required super.quantityM3,
    required super.status,
    required super.createdAt,
    super.origin,
    super.destination,
  });

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      id: map['id']?.toString() ?? '',
      material: map['material']?.toString() ?? map['material_type']?.toString() ?? '-',
      quantityM3: (map['quantity_m3'] as num?)?.toDouble() ?? 0,
      status: map['status']?.toString() ?? 'unknown',
      createdAt: DateTime.tryParse(map['created_at']?.toString() ?? '') ?? DateTime.now(),
      origin: map['origin']?.toString(),
      destination: map['destination']?.toString(),
    );
  }
}

class OrdersSummaryModel extends OrdersSummary {
  const OrdersSummaryModel({
    required super.current,
    required super.completed,
  });

  factory OrdersSummaryModel.fromMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      final currentRaw = (data['current'] as List<dynamic>?) ?? const [];
      final completedRaw = (data['completed'] as List<dynamic>?) ?? const [];
      return OrdersSummaryModel(
        current: currentRaw.whereType<Map<String, dynamic>>().map(OrderItemModel.fromMap).toList(),
        completed: completedRaw.whereType<Map<String, dynamic>>().map(OrderItemModel.fromMap).toList(),
      );
    }
    if (data is List) {
      final all = data.whereType<Map<String, dynamic>>().map(OrderItemModel.fromMap).toList();
      final current = all.where((order) => order.status != 'delivered' && order.status != 'completed').toList();
      final completed = all.where((order) => order.status == 'delivered' || order.status == 'completed').toList();
      return OrdersSummaryModel(current: current, completed: completed);
    }
    return const OrdersSummaryModel(current: [], completed: []);
  }
}
