import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';
import 'package:k9nix/app/core/theme/text_theme.dart';
import 'package:k9nix/app/global_widgets/custom_outline_button.dart';

class EmptyProductWidget extends StatelessWidget {
  const EmptyProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Không tìm thấy kết quả phù hợp",
            style: subTitle,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomOutlineButton(
              text: 'Tạo sản phẩm',
              backgroundColor: primaryColor,
              textColor: white,
              onPressed: () {
                Get.toNamed('/product-add');
              })
        ],
      ),
    );
  }
}
