import 'package:k9nix/app/data/models/product.dart';

class ProductOrder {
  final String id; // một định danh duy nhất cho mỗi đơn hàng
  final String customerId;
  final DateTime date; // ngày tháng của đơn hàng
  final List<Product> products; // danh sách các mặt hàng trong đơn hàng
  final int total; // tổng tiền của đơn hàng

  ProductOrder({
    required this.id,
    required this.customerId,
    required this.date,
    required this.products,
    required this.total,
  });

  // Chuyển đổi order thành Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      'date': date.toIso8601String(),
      'products': products.map((product) => product.toMap()).toList(),
      'total': total,
    };
  }

  // Chuyển đổi Map<String, dynamic> thành order
  factory ProductOrder.fromMap(Map<String, dynamic> map) {
    return ProductOrder(
      id: map['id'],
      customerId: map['customerId'],
      date: DateTime.parse(map['date']),
      products: (map['products'] as List)
          .map((product) => Product.fromMap(product))
          .toList(),
      total: map['total'],
    );
  }
}
