import 'package:flutter/widgets.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';

class StorageInfoWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const StorageInfoWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                icon,
                color: primaryColor,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'sans_semibold',
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const Text(
            "0",
            style: TextStyle(
              fontFamily: 'sans_bold',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
