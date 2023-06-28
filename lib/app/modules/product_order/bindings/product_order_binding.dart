import 'package:get/get.dart';

import '../controllers/product_order_controller.dart';

class ProductOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductOrderController>(
      () => ProductOrderController(),
    );
  }
}
