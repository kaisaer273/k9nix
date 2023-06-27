import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:k9nix/app/data/models/product.dart';
import 'package:k9nix/app/global_widgets/empty_widget.dart';
import 'package:k9nix/app/global_widgets/gid_nav_item.dart';
import 'package:k9nix/app/global_widgets/info_widget.dart';

import 'package:k9nix/app/modules/storage/controllers/storage_controller.dart';

class StorageBody extends GetView<StorageController> {
  const StorageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Obx(() => AnimatedContainer(
            curve: Curves.ease,
            duration: const Duration(milliseconds: 300),
            height: controller.isShowSearchBar.value ? 70 : 0,
            child: Container(
                child: controller.isShowSearchBar.value
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          autofocus: true,
                          onChanged: (value) => controller.filterproduct(value),
                          decoration: const InputDecoration(
                            hintText: "Search",
                          ),
                        ),
                      )
                    : null),
          )),
      Expanded(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 260,
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(
                              '${controller.filteredProductList.length} mã sản phẩm',
                              style: Theme.of(context).textTheme.displayMedium,
                            )),
                        Text(
                          'Báo cáo',
                          style: Theme.of(context).textTheme.headlineMedium,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: const [
                        Expanded(
                          child: InfoWidget(
                            title: "Giá trị tồn",
                            icon: Icons.monetization_on_outlined,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: InfoWidget(
                          title: "Số lượng",
                          icon: Icons.format_list_numbered_outlined,
                        )),
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
                                storageController: controller,
                                filteredProductList: filteredProductList,
                              );
                            })));
              }),
            ),
          ],
        ),
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
                    16, // Khoảng cách giữa các phần tử theo trục chính (vertical)
                crossAxisSpacing:
                    16, // Khoảng cách giữa các phần tử theo trục chéo (horizontal)
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

class _ProductCard extends StatelessWidget {
  final int index;
  final StorageController storageController;
  final RxList<Product> filteredProductList;
  const _ProductCard(
      {required this.index,
      required this.storageController,
      required this.filteredProductList});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        leading: const Icon(Icons.medication),
        title: Text(
          filteredProductList[index].name!,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.headlineMedium,
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
                  "${filteredProductList[index].salePrice} đ",
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
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Kho: ${filteredProductList[index].numInStorage ?? 0} "),
            (filteredProductList[index].numInStorage == null ||
                    filteredProductList[index].salePrice == null)
                ? Text(
                    "0 đ",
                    style: TextStyle(color: Get.theme.colorScheme.onPrimary),
                  )
                : Text(
                    "${filteredProductList[index].numInStorage! * filteredProductList[index].salePrice!} đ",
                    style: TextStyle(color: Get.theme.colorScheme.onPrimary),
                  ),
          ],
        ),
      ),
    );
  }
}
