import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/app_color.dart';

import 'package:k9nix/app/core/values/strings.dart';
import 'package:k9nix/app/modules/product/views/widgets/product_list_widget.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: const ProductListWidget(),
        ),
      ),
    );
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
        product,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      actions: [
        GestureDetector(
            onTap: () {
              controller.isShowSearchBar.value =
                  !controller.isShowSearchBar.value;
              if (!controller.isShowSearchBar.value) {
                controller.initFlilterList();
              }
            },
            child: Obx(
              () => controller.isShowSearchBar.value
                  ? const Icon(
                      Icons.close_outlined,
                      size: 30,
                      color: LightThemeColor.accent,
                    )
                  : const Icon(
                      Icons.search_outlined,
                      size: 30,
                      color: LightThemeColor.accent,
                    ),
            )),
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
}
