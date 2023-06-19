import 'package:flutter/material.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';
import 'package:k9nix/app/core/theme/text_theme.dart';

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
          style: subTitle,
        ),
        const SizedBox(height: 2),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            // errorText: _validate ? 'Vui lòng nhập tên sản phẩm' : null,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
