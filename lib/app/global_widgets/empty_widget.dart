import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final Widget logo;
  final String title;
  final bool condition;
  final Widget child;

  const EmptyWidget({
    Key? key,
    required this.title,
    this.condition = false,
    required this.child,
    required this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return condition
        ? child
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo,
                const SizedBox(height: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            ),
          );
  }
}
