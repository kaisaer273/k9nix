import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';
import 'package:k9nix/app/data/models/product.dart';
import 'package:k9nix/app/modules/product/controllers/product_controller.dart';

class ProductListWidget extends GetView<ProductController> {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Expanded(
          child: Obx(() {
            final filteredProductList = controller.filteredProductList;
            return ListView.builder(
                itemCount: filteredProductList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    index: index,
                    productController: controller,
                    filteredProductList: filteredProductList,
                  );
                });
          }),
        ),
      ]),
    );
  }
}

class ProductCard extends StatelessWidget {
  final int index;
  final ProductController productController;
  final RxList<Product> filteredProductList;
  const ProductCard(
      {super.key,
      required this.index,
      required this.productController,
      required this.filteredProductList});

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: bg2Color,
      child: ListTile(
        leading: const Icon(Icons.medication),
        title: Text(
          filteredProductList[index].name ?? "",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              filteredProductList[index].ingredient ?? "",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Row(
              children: [
                Text(
                  "${filteredProductList[index].salePrice} VND",
                  style: const TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const Text("/"),
                Text(filteredProductList[index].unit.toString())
              ],
            ),
          ],
        ),
        trailing: Text("Kho: ${filteredProductList[index].numInStorage ?? 0} "),
      ),
    );
  }
}