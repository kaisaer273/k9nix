import 'package:flutter/material.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Row(
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: bg2Color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                    color: true ? primaryColor : Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
              child: const Text(
                'Còn hàng',
                style: TextStyle(
                  color: true ? primaryColor : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: secondaryRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                    color: false ? secondaryColor : Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
              child: const Text(
                'Hết hàng',
                style: TextStyle(
                  color: false ? secondaryColor : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
