import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';
import 'package:k9nix/app/core/values/strings.dart';
import 'package:k9nix/app/modules/product/views/widgets/product_list_widget.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: secondaryColor,
          child: const Icon(
            Icons.add_outlined,
            size: 30,
            color: bgColor,
          )),
      appBar: AppBar(
        backgroundColor: bg2Color,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 30,
              color: primary2Color,
            )),
        title: const Text(
          product,
          style: TextStyle(
            color: primaryColor,
          ),
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
                        color: secondaryColor,
                      )
                    : const Icon(
                        Icons.search_outlined,
                        size: 30,
                        color: secondaryColor,
                      ),
              )),
          GestureDetector(
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
          height: double.infinity,
          width: double.infinity,
          color: bgColor,
          child: const ProductWidget(),
        ),
      ),
    );
  }
}
