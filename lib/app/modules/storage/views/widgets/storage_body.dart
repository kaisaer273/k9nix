import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';
import 'package:k9nix/app/data/models/product.dart';
import 'package:k9nix/app/modules/home/views/widgets/gid_nav_item.dart';
import 'package:k9nix/app/modules/product/controllers/product_controller.dart';
import 'package:k9nix/app/modules/product/views/widgets/empty_product_widget.dart';
import 'package:k9nix/app/modules/storage/views/widgets/storage_info_widget.dart';

class StorageBody extends GetView<ProductController> {
  const StorageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Obx(() => AnimatedContainer(
            margin: const EdgeInsets.only(bottom: 10),
            duration: const Duration(milliseconds: 300),
            height: controller.isShowSearchBar.value ? 80 : 250,
            child: Container(
              child: controller.isShowSearchBar.value
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        autofocus: true,
                        onChanged: (value) => controller.filterproduct(value),
                        decoration: const InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: primaryColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          )),
                        ),
                      ),
                    )
                  : Container(
                      color: primaryColor,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${controller.productList.length} mã sản phẩm',
                                  style: const TextStyle(
                                    color: bgColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const Text(
                                  'Báo cáo',
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const StorageInfoWidget(
                                            title: 'Giá trị tồn',
                                            icon: Icons
                                                .monetization_on_outlined))),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const StorageInfoWidget(
                                            title: 'Số lượng',
                                            icon: Icons
                                                .format_list_numbered_outlined))),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          _gridNavigationBar(),
                        ],
                      ),
                    ),
            ),
          )),
      Expanded(
        child: Obx(() {
          final filteredProductList = controller.filteredProductList;
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: (filteredProductList.isEmpty)
                  ? const EmptyProductWidget()
                  : ListView.builder(
                      itemCount: filteredProductList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCard(
                          index: index,
                          productController: controller,
                          filteredProductList: filteredProductList,
                        );
                      }));
        }),
      ),
    ]);
  }

  _gridNavigationBar() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 4, // Số lượng cột trong lưới
                mainAxisSpacing:
                    15, // Khoảng cách giữa các phần tử theo trục chính (vertical)
                crossAxisSpacing:
                    15, // Khoảng cách giữa các phần tử theo trục chéo (horizontal)
                childAspectRatio: 1, // Tỷ lệ khung hình của mỗi phần tử
                children: [
                  GridNavItem(icon: Icons.event, text: 'Sổ kho', onTap: () {}),
                  GridNavItem(
                      icon: Icons.download_for_offline_outlined,
                      text: 'Sổ nhập hàng',
                      onTap: () {}),
                  GridNavItem(
                      icon: Icons.print_outlined, text: 'In tem', onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
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
