import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Get.textTheme.bodyMedium,
        ),
        const SizedBox(height: 2),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            // errorText: _validate ? 'Vui lòng nhập tên sản phẩm' : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Get.theme.colorScheme.primary,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
