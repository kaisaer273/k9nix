import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product_order/bindings/product_order_binding.dart';
import '../modules/product_order/views/Product_order_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/product_add/bindings/product_add_binding.dart';
import '../modules/product_add/views/product_add_view.dart';
import '../modules/storage/bindings/storage_binding.dart';
import '../modules/storage/views/storage_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.STORAGE,
      page: () => StorageView(),
      binding: StorageBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_ADD,
      page: () => const ProductAddView(),
      binding: ProductAddBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: ProductOrderBinding(),
    ),
  ];
}
