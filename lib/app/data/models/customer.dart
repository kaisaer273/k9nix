import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:k9nix/app/data/models/product_order.dart';

class Customer {
  late final String? id; // một định danh duy nhất cho mỗi khách hàng
  late final String name; // tên của khách hàng
  late final String? phone; // số điện thoại của khách hàng
  late final String? address; // địa chỉ của khách hàng
  late final int?
      debt; // số tiền nợ cửa hàng, dương nếu khách hàng nợ, âm nếu cửa hàng nợ
  final List<ProductOrder>? orders; // danh sách các đơn hàng của khách hàng

  Customer({
    this.id,
    required this.name,
    this.phone,
    this.address = "",
    this.debt = 0,
    List<ProductOrder>? orders,
  }) : orders = orders ?? <ProductOrder>[];

  // Chuyển đổi customer thành Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'address': address,
      'debt': debt!.toInt(),
      'orders': orders!.map((order) => order.toMap()).toList(),
    };
  }

  factory Customer.fromDocument(DocumentSnapshot doc) {
    return Customer(
      id: doc.id,
      name: doc['name'],
      phone: doc['phone'],
      address: doc['address'],
      debt: doc['debt'] ?? 0,
      orders: doc['orders'] != null
          ? (doc['orders'] as List)
              .map((item) => ProductOrder.fromMap(item))
              .toList()
          : [],
    );
  }

  final CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');

  // Thêm customer mới vào Firestore
  Future<void> addCustomer() async {
    await customers.doc(id).set(toMap());
  }

  // Cập nhật thông tin customer trong Firestore
  Future<void> updateCustomer() async {
    await customers.doc(id).update(toMap());
  }

  // Xóa customer khỏi Firestore
  Future<void> deleteCustomer() async {
    await customers.doc(id).delete();
  }
}
