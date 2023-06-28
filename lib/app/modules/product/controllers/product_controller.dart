import 'package:get/get.dart';
import 'package:k9nix/app/data/models/product.dart';
import 'package:k9nix/app/modules/storage/controllers/storage_controller.dart';

final StorageController storageController = Get.put(StorageController());

class ProductController extends GetxController {
  final List<Product> _data = storageController.productList;
  RxList<Product> filteredProductList = RxList([]);
  var isShowSearchBar = false.obs;

  @override
  void onInit() {
    super.onInit();
    initFlilterList();
  }

  void initFlilterList() {
    filteredProductList.value = _data;
  }

  void filterproduct(String query) {
    // Lọc danh sách dựa trên query
    filteredProductList.value = _data.where((item) {
      return item.name!.toLowerCase().contains(query.toLowerCase()) ||
          item.ingredient!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
