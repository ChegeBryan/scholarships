import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      cursorColor: _primaryColor,
      fontFamily: 'Lato',
      scaffoldBackgroundColor: _bgColor,
      backgroundColor: _bgColor,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      cursorColor: _primaryColor,
      fontFamily: 'Lato',
    );
  }

  static const _primaryColor = Color(0xFF142AA6);
  static const _accentColor = Color(0xFFF2295F);
  static const _bgColor = Color(0xFFF2F3F8);
}
