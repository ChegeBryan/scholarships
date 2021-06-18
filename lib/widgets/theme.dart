import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      cursorColor: _primaryColor,
      fontFamily: 'Avenir',
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
      fontFamily: 'Avenir',
    );
  }

  static const _primaryColor = Color(0xFF1E22AA);
  static const _accentColor = Color(0xFFE40046);
  static const _bgColor = Color(0xFFF2F3F8);
}
