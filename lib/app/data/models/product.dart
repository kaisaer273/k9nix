import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? id; // một định danh duy nhất cho mỗi sản phẩm
  String? name; // tên của sản phẩm
  String? ingredient; // thành phần của sản phẩm
  String? unit; // đơn vị tính của sản phẩm
  String? imgUrl; // đường dẫn ảnh của sản phẩm
  String? skuCode; // mã SKU của sản phẩm
  String? barCode; // mã vạch của sản phẩm
  int? purchasePrice; // giá mua vào của sản phẩm
  int? salePrice; // giá bán ra của sản phẩm
  bool? isAvaiable; // trạng thái có sẵn hay không của sản phẩm
  int? numInStorage; // số lượng trong kho của sản phẩm
  int? numSold; // số lượng đã bán của sản phẩm
  DateTime? createdAt; // ngày khởi tạo sản phẩm

  Product({
    this.id,
    required this.name,
    this.ingredient,
    this.unit,
    this.imgUrl,
    this.skuCode,
    this.barCode,
    required this.purchasePrice,
    required this.salePrice,
    this.isAvaiable = false,
    this.numInStorage = 0,
    this.numSold = 0,
    this.createdAt,
  });

  // Chuyển đổi product thành Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ingredient': ingredient,
      'unit': unit,
      'imgUrl': imgUrl,
      'skuCode': skuCode,
      'barCode': barCode,
      'purchasePrice': purchasePrice,
      'salePrice': salePrice,
      'isAvaiable': isAvaiable,
      'numInStorage': numInStorage,
      'numSold': numSold,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  // Chuyển đổi Map<String, dynamic> thành product
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      ingredient: map['ingredient'],
      unit: map['unit'],
      imgUrl: map['imgUrl'],
      skuCode: map['skuCode'],
      barCode: map['barCode'],
      purchasePrice: map['purchasePrice'],
      salePrice: map['salePrice'],
      isAvaiable: map['isAvaiable'],
      numInStorage: map['numInStorage'],
      numSold: map['numSold'],
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
    );
  }

  // Thêm product mới vào Firestore
  Future<void> addProduct() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    createdAt =
        DateTime.now(); // gán giá trị cho createdAt bằng thời gian hiện tại
    await products.doc(id).set(toMap());
  }

  // Cập nhật thông tin product trong Firestore
  Future<void> updateProduct() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    await products.doc(id).update(toMap());
  }

  // Xóa product khỏi Firestore
  Future<void> deleteProduct() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    await products.doc(id).delete();
  }
}
