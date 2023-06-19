import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';
import 'package:k9nix/app/core/values/strings.dart';
import 'package:k9nix/app/modules/product/controllers/product_controller.dart';
import 'package:k9nix/app/modules/product/views/widgets/product_list_widget.dart';
import 'package:k9nix/app/modules/storage/views/widgets/storage_body.dart';

import '../controllers/storage_controller.dart';

class StorageView extends GetView<StorageController> {
  final ProductController productController = Get.find<ProductController>();

  StorageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 30,
              color: primary2Color,
            )),
        title: const Text(
          storage,
          style: TextStyle(
            color: bgColor,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                productController.isShowSearchBar.value =
                    !productController.isShowSearchBar.value;
                if (!productController.isShowSearchBar.value) {
                  productController.initFlilterList();
                }
              },
              child: Obx(
                () => productController.isShowSearchBar.value
                    ? const Icon(
                        Icons.close_outlined,
                        size: 30,
                        color: secondaryColor,
                      )
                    : const Icon(
                        Icons.search_outlined,
                        size: 30,
                        color: secondaryColor,
                      ),
              )),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(
                Icons.qr_code_scanner_outlined,
                size: 30,
                color: secondaryColor,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          // height: double.infinity,
          // width: double.infinity,
          color: bgColor,
          child: const StorageBody(),
        ),
      ),
    );
  }
}
