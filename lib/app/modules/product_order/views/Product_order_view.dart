import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/app_color.dart';
import 'package:k9nix/app/core/values/strings.dart';
import 'package:k9nix/app/global_widgets/empty_widget.dart';
import 'package:k9nix/app/modules/product_order/views/widgets/product_list_view_c.dart';
import 'package:k9nix/app/modules/product_order/views/widgets/product_order_body.dart';

import '../controllers/product_order_controller.dart';

class ProductOrderView extends GetView<ProductOrderController> {
  const ProductOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
          appBar: _appbar(context),
          bottomNavigationBar: controller.cartProduct.isNotEmpty
              ? _bottomAppBar(height, width, context)
              : const SizedBox(),
          body: const ProductOrderBody(),
        ));
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
          )),
      title: Text(
        order,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(
              Icons.qr_code_scanner_outlined,
              size: 30,
              color: LightThemeColor.accent,
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomAppBar(double height, double width, BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: height * 0.05 + 110,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Obx(() {
                          return Text(
                            "\$${controller.totalPrice}",
                            style: Theme.of(context).textTheme.displayMedium,
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Thanh toán"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
