import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:k9nix/app/global_widgets/custom_outline_button.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Get.theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomOutlineButton(
                onPressed: () {},
                text: 'Còn hàng',
                textColor: false ? Get.theme.colorScheme.primary : Colors.grey,
                backgroundColor: false
                    ? Get.theme.colorScheme.surfaceVariant
                    : Colors.transparent,
                borderColor:
                    false ? Get.theme.colorScheme.primary : Colors.transparent,
              ),
            ),
            Expanded(
              child: CustomOutlineButton(
                onPressed: () {},
                text: 'Hết hàng',
                textColor: true ? Get.theme.colorScheme.secondary : Colors.grey,
                backgroundColor: true
                    ? Get.theme.colorScheme.onSurfaceVariant
                    : Colors.transparent,
                borderColor:
                    true ? Get.theme.colorScheme.secondary : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
