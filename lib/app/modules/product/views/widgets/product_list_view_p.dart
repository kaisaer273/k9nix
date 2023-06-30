import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:k9nix/app/core/theme/app_color.dart';
import 'package:k9nix/app/data/models/product.dart';
import 'package:k9nix/app/modules/product/controllers/product_controller.dart';
import 'package:k9nix/app/modules/product_order/controllers/product_order_controller.dart';

class ProductListViewP extends GetView<ProductController> {
  final List<Product> products;
  final ProductOrderController productOrderController;

  const ProductListViewP({
    Key? key,
    required this.products,
    required this.productOrderController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        top: 20,
      ),
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (_, index) {
        Product product = products[index];
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
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
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${product.name!}dddddddddddddddddddddddddddddd",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product.ingredient ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${product.salePrice} đ",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: LightThemeColor.accent),
                    ),
                  ],
                ),
              ),
              Obx(() => IconButton(
                    onPressed: (productOrderController.cartProduct
                            .containsKey(product))
                        ? () => productOrderController.removeFromCart(product)
                        : () => productOrderController.addToCart(product),
                    icon: (productOrderController.cartProduct
                            .containsKey(product))
                        ? const Icon(
                            Icons.assignment_add,
                            color: LightThemeColor.accent,
                          )
                        : const Icon(Icons.assignment_add),
                  )),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(padding: EdgeInsets.only(bottom: 16));
      },
    );
  }
}
