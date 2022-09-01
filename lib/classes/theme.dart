import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey,
      colorScheme: const ColorScheme.dark());
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.red,
      colorScheme: const ColorScheme.light());
}
