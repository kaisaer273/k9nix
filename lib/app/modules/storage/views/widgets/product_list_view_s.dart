import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:k9nix/app/core/theme/app_color.dart';
import 'package:k9nix/app/data/models/product.dart';

import '../../controllers/storage_controller.dart';

class ProductListViewS extends GetView<StorageController> {
  final List<Product> products;

  const ProductListViewS({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (_, index) {
        Product product = products[index];
        return GestureDetector(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     CustomPageRoute(child: ProductDetailScreen(product: product)),
          //   );
          // },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      width: 50,
                      child: Image.network(
                          'https://png.pngtree.com/png-clipart/20230504/original/pngtree-medicine-flat-icon-png-image_9138002.png',
                          scale: 6),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 4,
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
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${product.salePrice} đ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: LightThemeColor.accent),
                        ),
                        Text(
                          "Mã: ${product.skuCode}",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Kho: ${product.numInStorage}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        '${product.unit}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "${product.numInStorage! * product.salePrice!} đ",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(padding: EdgeInsets.only(bottom: 16));
      },
    );
  }
}
