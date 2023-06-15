import 'package:flutter/widgets.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';

class GridNavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;
  const GridNavItem(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: bg2Color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: primaryColor,
              size: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'sans_semibold',
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
