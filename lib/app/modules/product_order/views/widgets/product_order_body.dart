import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9nix/app/global_widgets/empty_widget.dart';
import 'package:k9nix/app/modules/product_order/controllers/product_order_controller.dart';
import 'package:k9nix/app/modules/product_order/views/widgets/product_list_view_c.dart';

class ProductOrderBody extends GetView<ProductOrderController> {
  const ProductOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Obx(
        () => EmptyWidget(
          logo: Icon(
            Icons.add_shopping_cart_outlined,
            color: Theme.of(context).colorScheme.tertiary,
            size: 100,
          ),
          title: "Đơn hàng trống",
          condition: controller.cartProduct.isNotEmpty,
          child: SingleChildScrollView(
              child: GetBuilder(
            builder: (ProductOrderController controller) => Column(
              children: const [
                ProductListViewC(),
                TextField(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
