import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:k9nix/app/data/models/product.dart';
import 'package:k9nix/app/global_widgets/empty_widget.dart';
import 'package:k9nix/app/modules/product/controllers/product_controller.dart';

class ProductListWidget extends GetView<ProductController> {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: controller.isShowSearchBar.value ? 70 : 0,
              child: Container(
                child: controller.isShowSearchBar.value
                    ? TextField(
                        autofocus: true,
                        onChanged: (value) => controller.filterproduct(value),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle:
                              TextStyle(color: Get.theme.colorScheme.onPrimary),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          )),
                        ),
                      )
                    : null,
              ),
            )),
        Expanded(
          child: Obx(() {
            final filteredProductList = controller.filteredProductList;
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: EmptyWidget(
                    condition: filteredProductList.isNotEmpty,
                    title: "Không tìm được sản phẩm",
                    logo: const Icon(
                      Icons.add_box_outlined,
                      size: 100,
                    ),
                    child: ListView.builder(
                        itemCount: filteredProductList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _ProductCard(
                            index: index,
                            productController: controller,
                            filteredProductList: filteredProductList,
                          );
                        })));
          }),
        ),
      ]),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final int index;
  final ProductController productController;
  final RxList<Product> filteredProductList;
  const _ProductCard(
      {super.key,
      required this.index,
      required this.productController,
      required this.filteredProductList});

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: bg2Color,
      child: ListTile(
        leading: Image.network(
            'https://png.pngtree.com/png-clipart/20230504/original/pngtree-medicine-flat-icon-png-image_9138002.png',
            scale: 6),
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
                  style: TextStyle(
                    color: Get.theme.colorScheme.onPrimary,
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
        trailing: IconButton(
          icon: const Icon(Icons.article_outlined),
          onPressed: () {},
        ),
      ),
    );
  }
}
