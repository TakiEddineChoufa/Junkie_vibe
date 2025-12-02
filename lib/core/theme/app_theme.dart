import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: JunkieColors.background,
      primaryColor: JunkieColors.accent,
      fontFamily: 'Inter', // optional
      colorScheme: const ColorScheme.dark(
        primary: JunkieColors.accent,
        secondary: JunkieColors.accent,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: JunkieColors.accent,
        unselectedItemColor: Colors.grey,
        backgroundColor: JunkieColors.background,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
