import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:k9nix/app/global_widgets/empty_widget.dart';
import 'package:k9nix/app/global_widgets/gid_nav_item.dart';
import 'package:k9nix/app/global_widgets/info_widget.dart';

import 'package:k9nix/app/modules/storage/controllers/storage_controller.dart';
import 'package:k9nix/app/modules/storage/views/widgets/product_list_view_s.dart';

class StorageBody extends GetView<StorageController> {
  const StorageBody({Key? key}) : super(key: key);

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
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    Row(
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
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: const InfoWidget(
                              title: "Giá trị tồn",
                              icon: Icons.monetization_on_outlined,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: const InfoWidget(
                            title: "Số lượng",
                            icon: Icons.format_list_numbered_outlined,
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _gridNavigationBar(),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  final filteredProductList = controller.filteredProductList;
                  return EmptyWidget(
                    condition: filteredProductList.isNotEmpty,
                    title: "Không tìm được sản phẩm",
                    logo: Icon(
                      Icons.youtube_searched_for_rounded,
                      size: 100,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    child: GetBuilder(
                      builder: (StorageController controller) {
                        return ProductListViewS(
                          products: controller.filteredProductList,
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  _gridNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GridNavItem(icon: Icons.event, text: 'Sổ kho', onTap: () {}),
        GridNavItem(icon: Icons.file_download, text: 'Nhập hàng', onTap: () {}),
        GridNavItem(icon: Icons.file_upload, text: 'Xuất hàng', onTap: () {}),
        GridNavItem(icon: Icons.print_outlined, text: 'In tem', onTap: () {}),
      ],
    );
  }
}
