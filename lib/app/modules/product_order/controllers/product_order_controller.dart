import 'package:get/get.dart';
import 'package:k9nix/app/data/models/product.dart';

class ProductOrderController extends GetxController {
  final RxMap<dynamic, dynamic> _cartProduct = <dynamic, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void addToCart(Product product) {
    if (!_cartProduct.containsKey(product)) {
      _cartProduct[product] = 1;
    }
  }

  void removeFromCart(Product product) {
    _cartProduct.remove(product);
  }

  void increaseItem(Product product) {
    _cartProduct[product] += 1;
  }

  void decreaseItem(Product product) {
    if (_cartProduct[product] == 1) {
      removeFromCart(product);
    } else {
      _cartProduct[product] -= 1;
    }
  }

  int productValue(Product product) => _cartProduct[product];
  int calculatePricePerEachItem(Product product) {
    int price = 0;
    price = productValue(product) * product.salePrice!;
    return price;
  }

  get cartProduct => _cartProduct;
  get totalPrice => (_cartProduct.isNotEmpty)
      ? _cartProduct.entries
          .map((e) => e.key.salePrice! * e.value)
          .toList()
          .reduce((value, element) => value + element)
      : 0;
}
