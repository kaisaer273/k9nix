import 'package:get/get.dart';

import '../controllers/product_add_controller.dart';

class ProductAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductAddController>(
      () => ProductAddController(),
    );
  }
}
