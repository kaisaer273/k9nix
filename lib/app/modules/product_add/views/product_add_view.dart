import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';
import 'package:k9nix/app/core/theme/text_theme.dart';
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
        title: const Text(
          'Tạo sản phẩm',
          style: TextStyle(color: bgColor),
        ),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
            color: primary2Color,
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
      color: bgColor,
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
            textColor: bgColor,
            backgroundColor: primaryColor,
          )),
        ],
      ),
    );
  }

  Container _moreProductInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: bg2Color,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin khác',
            style: title,
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(label: 'Đơn vị', hintText: 'Hộp, Lọ, Gói...'),
          SizedBox(
            height: 20,
          ),
          CustomTextField(label: 'Mô tả', hintText: 'Mô tả sản phẩm'),
        ],
      ),
    );
  }

  Container _manageProductStorage() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: bg2Color,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quản lý tồn kho',
            style: title,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tình trạng sản phẩm',
                style: subTitle,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(child: CustomToggleButton())
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
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
      color: bg2Color,
      child: const Column(
        children: [
          CustomTextField(
            label: 'Tên sản phẩm *',
            hintText: 'Nhập tên sản phẩm',
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            label: 'Thành phần',
            hintText: 'Nhập tên thành phần',
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
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
              const BorderSide(
                color: primaryColor,
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
              const BorderSide(
                color: primaryColor,
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
