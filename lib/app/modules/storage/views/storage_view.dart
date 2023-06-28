import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/app_color.dart';

import 'package:k9nix/app/core/values/strings.dart';
import 'package:k9nix/app/modules/product/controllers/product_controller.dart';

import 'package:k9nix/app/modules/storage/views/widgets/storage_body.dart';

import '../controllers/storage_controller.dart';

class StorageView extends GetView<StorageController> {
  final ProductController productController = Get.find<ProductController>();

  StorageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: _appbar(context),
      body: const SafeArea(
        child: StorageBody(),
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
        storage,
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
