import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:k9nix/app/global_widgets/empty_widget.dart';
import 'package:k9nix/app/modules/product/controllers/product_controller.dart';
import 'package:k9nix/app/modules/product/views/widgets/product_list_view_p.dart';
import 'package:k9nix/app/modules/product_order/controllers/product_order_controller.dart';

class ProductBody extends GetView<ProductController> {
  ProductBody({super.key});
  final ProductOrderController productOrderController =
      Get.put(ProductOrderController());
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Obx(() => AnimatedContainer(
            curve: Curves.ease,
            duration: const Duration(milliseconds: 300),
            height: controller.isShowSearchBar.value ? 70 : 0,
            child: Container(
                child: controller.isShowSearchBar.value
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          autofocus: true,
                          onChanged: (value) => controller.filterproduct(value),
                          decoration: const InputDecoration(
                            hintText: "Search",
                          ),
                        ),
                      )
                    : null),
          )),
      Expanded(
          child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Obx(() {
          final filteredProductList = controller.filteredProductList;
          return EmptyWidget(
            condition: filteredProductList.isNotEmpty,
            title: "Không tìm được sản phẩm",
            logo: Icon(
              Icons.youtube_searched_for_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            child: GetBuilder(
              builder: (ProductController controller) {
                return ProductListViewP(
                  products: controller.filteredProductList,
                  productOrderController: productOrderController,
                );
              },
            ),
          );
        }),
      )),
    ]);
  }
}
