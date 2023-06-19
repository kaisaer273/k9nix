import 'package:get/get.dart';
import 'package:k9nix/app/modules/product/controllers/product_controller.dart';

import '../controllers/storage_controller.dart';

class StorageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageController>(
      () => StorageController(),
    );
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
  }
}
