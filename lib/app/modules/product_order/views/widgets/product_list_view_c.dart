import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/app_color.dart';
import 'package:k9nix/app/data/models/product.dart';
import 'package:k9nix/app/global_widgets/counter_button.dart';
import 'package:k9nix/app/modules/product_order/controllers/product_order_controller.dart';

class ProductListViewC extends GetView<ProductOrderController> {
  const ProductListViewC({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            bottom: 30,
          ),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.cartProduct.length,
          itemBuilder: (_, index) {
            Product product = controller.cartProduct.keys.toList()[index];
            return Dismissible(
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  controller.removeFromCart(product);
                }
              },
              key: Key(product.skuCode!),
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
                          product.name!,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${product.salePrice}",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        CounterButton(
                          onIncrementSelected: () =>
                              controller.increaseItem(product),
                          onDecrementSelected: () =>
                              controller.decreaseItem(product),
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
                          "${controller.calculatePricePerEachItem(product)}",
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
          separatorBuilder: (_, __) =>
              const Padding(padding: EdgeInsets.all(10)),
        ));
  }
}
