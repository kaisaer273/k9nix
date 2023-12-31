import 'package:flutter/material.dart';
import './app_style.dart';
import './app_color.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green).copyWith(
        primary: LightThemeColor.primaryDark,
        secondary: LightThemeColor.primaryLight,
        tertiary: LightThemeColor.yellow,
        onPrimary: Colors.black87,
        onSecondary: Colors.black87,
        surface: LightThemeColor.primaryLight),
    scaffoldBackgroundColor: LightThemeColor.primaryDark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: LightThemeColor.yellow,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black45),
      centerTitle: false,
      titleTextStyle: h2Style,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          LightThemeColor.yellow,
        ),
      ),
    ),
    hintColor: Colors.black45,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: textFieldStyle,
      focusedBorder: textFieldStyle,
      filled: true,
      contentPadding: const EdgeInsets.all(20),
      fillColor: LightThemeColor.primaryLight,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: LightThemeColor.accent,
    ),
    textTheme: const TextTheme(
      displayLarge: h1Style,
      displayMedium: h2Style,
      displaySmall: h3Style,
      headlineMedium: h4StyleLight,
      headlineSmall: h5StyleLight,
      bodyLarge: bodyTextLight,
      titleMedium: subtitleLight,
    ),
    iconTheme: const IconThemeData(color: Colors.black45),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green).copyWith(
      primary: DarkThemeColor.primaryDark,
      secondary: DarkThemeColor.primaryLight,
      tertiary: LightThemeColor.accent,
      onSecondary: Colors.white,
      onPrimary: Colors.white,
      surface: DarkThemeColor.primaryLight,
    ),
    canvasColor: DarkThemeColor.primaryDark,
    scaffoldBackgroundColor: DarkThemeColor.primaryDark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: LightThemeColor.accent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarTextStyle: TextStyle(color: Colors.white),
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: h2Style,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          LightThemeColor.accent,
        ),
      ),
    ),
    hintColor: Colors.white60,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: textFieldStyle,
      focusedBorder: textFieldStyle,
      filled: true,
      contentPadding: const EdgeInsets.all(20),
      fillColor: DarkThemeColor.primaryLight,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: DarkThemeColor.primaryLight,
      selectedItemColor: LightThemeColor.accent,
      unselectedItemColor: Colors.white70,
    ),
    textTheme: TextTheme(
      displayLarge: h1Style.copyWith(color: Colors.white),
      displayMedium: h2Style.copyWith(color: Colors.white),
      displaySmall: h3Style.copyWith(color: Colors.white),
      headlineMedium: h4StyleLight.copyWith(color: Colors.white),
      headlineSmall: h5StyleLight.copyWith(color: Colors.white),
      bodyLarge: bodyTextLight.copyWith(color: Colors.white),
      titleMedium: subtitleLight.copyWith(color: Colors.white60),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: DarkThemeColor.primaryLight,
    ),
  );
}
