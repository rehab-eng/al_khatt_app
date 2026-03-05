class OrderItem {
  const OrderItem({
    required this.id,
    required this.material,
    required this.quantityM3,
    required this.status,
    required this.createdAt,
    this.origin,
    this.destination,
  });

  final String id;
  final String material;
  final double quantityM3;
  final String status;
  final DateTime createdAt;
  final String? origin;
  final String? destination;
}

class OrdersSummary {
  const OrdersSummary({
    required this.current,
    required this.completed,
  });

  final List<OrderItem> current;
  final List<OrderItem> completed;
}
