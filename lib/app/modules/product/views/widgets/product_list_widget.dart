import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';
import 'package:k9nix/app/data/models/product.dart';
import 'package:k9nix/app/modules/product/controllers/product_controller.dart';

class ProductWidget extends GetView<ProductController> {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Obx(
          () => (controller.isShowSearchBar.value)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    autofocus: true,
                    cursorColor: primaryColor,
                    onChanged: (value) {
                      controller.filterproduct(value);
                    },
                    style: const TextStyle(color: gradient1),
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                  ))
              : Container(),
        ),
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
                Text("${filteredProductList[index].salePrice} VND"),
                const Text("/"),
                Text(filteredProductList[index].unit.toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
