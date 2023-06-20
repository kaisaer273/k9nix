import 'package:flutter/material.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';
import 'package:k9nix/app/global_widgets/custom_outline_button.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomOutlineButton(
                onPressed: () {},
                text: 'Còn hàng',
                textColor: false ? primaryColor : Colors.grey,
                backgroundColor: false ? bg2Color : Colors.transparent,
                borderColor: false ? primaryColor : Colors.transparent,
              ),
            ),
            Expanded(
              child: CustomOutlineButton(
                onPressed: () {},
                text: 'Hết hàng',
                textColor: true ? secondaryColor : Colors.grey,
                backgroundColor: true ? secondary2Color : Colors.transparent,
                borderColor: true ? secondaryColor : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
