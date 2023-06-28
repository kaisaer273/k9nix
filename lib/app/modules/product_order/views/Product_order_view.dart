import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/app_color.dart';
import 'package:k9nix/app/core/values/strings.dart';
import 'package:k9nix/app/global_widgets/counter_button.dart';
import 'package:k9nix/app/global_widgets/empty_widget.dart';
import 'package:k9nix/app/modules/product/controllers/product_controller.dart';

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
          body: EmptyWidget(
            logo: Icon(
              Icons.add_shopping_cart_outlined,
              color: Theme.of(context).colorScheme.tertiary,
              size: 100,
            ),
            title: "Đơn hàng trống",
            condition: controller.cartProduct.isNotEmpty,
            child: SingleChildScrollView(
              child: SizedBox(
                height: height - (height * 0.05 + 110),
                child: GetBuilder(
                  builder: (ProductController controller) =>
                      orderItemsListView(context),
                ),
              ),
            ),
          ),
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

  Widget orderItemsListView(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      shrinkWrap: true,
      itemCount: controller.cartProduct.length,
      itemBuilder: (_, index) {
        return Dismissible(
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              controller
                  .removeFromCart(controller.cartProduct.keys.toList()[index]);
            }
          },
          key: Key(controller.cartProduct.keys.toList()[index].name),
          background: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.delete_outline_outlined),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: 50,
                  child: Image.network(
                      'https://png.pngtree.com/png-clipart/20230504/original/pngtree-medicine-flat-icon-png-image_9138002.png',
                      scale: 6),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.cartProduct.keys.toList()[index].name,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${controller.cartProduct.keys.toList()[index].salePrice}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    CounterButton(
                      onIncrementSelected: () => controller.increaseItem(
                          controller.cartProduct.keys.toList()[index]),
                      onDecrementSelected: () => controller.decreaseItem(
                          controller.cartProduct.keys.toList()[index]),
                      size: const Size(24, 24),
                      padding: 0,
                      label: Text(
                        controller.cartProduct.values
                            .toList()[index]
                            .toString(),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Text(
                      "${controller.calculatePricePerEachItem(controller.cartProduct.keys.toList()[index])}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: LightThemeColor.accent),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const Padding(padding: EdgeInsets.all(10)),
    );
  }
}
