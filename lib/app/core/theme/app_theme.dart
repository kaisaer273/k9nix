import 'package:flutter/material.dart';
import 'package:k9nix/app/core/theme/color_theme.dart';

ColorScheme colorSchemeLight = const ColorScheme(
  // primary green
  primary: primaryColor,
  // primary blue
  primaryContainer: bg2Color,
  // gradient 1
  surface: bg2Color,
  // gradient 2
  background: bgColor,
  // secondary grey
  //secondary: Color(0xffF1F3F4),
  secondary: secondaryGrey,
  // secondary dark grey
  secondaryContainer: secondaryDarkGrey,
  // secondary red
  error: secondaryRed,
  // primary green
  onPrimary: primaryColor,
  // primary blue
  onSecondary: primaryBlue,
  // secondary grey
  onSurface: secondaryGrey,
  // secondary dark grey
  onBackground: secondaryDarkGrey,
  // secondary red
  onError: secondaryRed,
  // white
  brightness: Brightness.light,
);

ThemeData lightTheme = ThemeData.from(colorScheme: colorSchemeLight);
