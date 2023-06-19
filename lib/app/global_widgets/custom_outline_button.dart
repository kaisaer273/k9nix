import 'package:flutter/material.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;

  final Function onPressed;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.borderColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonTextColor = textColor ?? Colors.black;
    Color buttonBorderColor = borderColor ?? primaryColor;
    Color background = backgroundColor ?? bgColor;

    return OutlinedButton(
      onPressed: () => onPressed(),
      style: OutlinedButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(
          color: buttonBorderColor,
          width: 2.0,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: buttonTextColor,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
