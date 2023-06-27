import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:k9nix/app/global_widgets/custom_outline_button.dart';
import 'package:k9nix/app/modules/product_add/views/widgets/custom_textfield.dart';
import 'package:k9nix/app/modules/product_add/views/widgets/custom_toggle_button.dart';

import '../controllers/product_add_controller.dart';

class ProductAddView extends GetView<ProductAddController> {
  const ProductAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tạo sản phẩm',
          style: TextStyle(color: Get.theme.colorScheme.onPrimary),
        ),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
            color: Get.theme.colorScheme.onPrimary,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: _addProductImg(),
                ),
                _inputProductInfo(),
                const SizedBox(
                  height: 16,
                ),
                _manageProductStorage(),
                const SizedBox(
                  height: 16,
                ),
                _moreProductInfo(),
              ]),
            ),
          ),
          _footer(),
        ],
      ),
    );
  }

  Container _footer() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Get.theme.colorScheme.background,
      child: Row(
        children: [
          Expanded(
              child: CustomOutlineButton(
            onPressed: () {},
            text: 'Tạo thêm',
          )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: CustomOutlineButton(
            onPressed: () {},
            text: 'Hoàn tất',
            textColor: Get.theme.colorScheme.onPrimary,
            backgroundColor: Get.theme.colorScheme.primary,
          )),
        ],
      ),
    );
  }

  Container _moreProductInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Get.theme.colorScheme.surfaceVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin khác',
            style: Get.textTheme.bodySmall,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(label: 'Đơn vị', hintText: 'Hộp, Lọ, Gói...'),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(label: 'Mô tả', hintText: 'Mô tả sản phẩm'),
        ],
      ),
    );
  }

  Container _manageProductStorage() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Get.theme.colorScheme.surfaceVariant,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quản lý tồn kho',
            style: Get.textTheme.bodySmall,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tình trạng sản phẩm',
                style: Get.textTheme.labelMedium,
              ),
              const SizedBox(
                width: 8,
              ),
              const Expanded(child: CustomToggleButton())
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Expanded(
                  child:
                      CustomTextField(label: 'Mã SKU', hintText: 'SKU code')),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: CustomTextField(label: 'Mã QR', hintText: 'QR code')),
            ],
          )
        ],
      ),
    );
  }

  Container _inputProductInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Get.theme.colorScheme.surfaceVariant,
      child: Column(
        children: [
          const CustomTextField(
            label: 'Tên sản phẩm *',
            hintText: 'Nhập tên sản phẩm',
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            label: 'Thành phần',
            hintText: 'Nhập tên thành phần',
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Expanded(
                child: CustomTextField(
                  label: 'Giá nhập',
                  hintText: '10000 VND',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomTextField(
                  label: 'Giá bán *',
                  hintText: '10000 VND',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column _addProductImg() {
    return Column(
      children: [
        TextButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(12),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: Get.theme.colorScheme.primary,
                width: 2.0,
              ),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.add_photo_alternate_outlined),
          label: const Text('Tải ảnh lên'),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(12),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: Get.theme.colorScheme.primary,
                width: 2.0,
              ),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.add_a_photo_outlined),
          label: const Text('Chụp ảnh'),
        )
      ],
    );
  }
}
