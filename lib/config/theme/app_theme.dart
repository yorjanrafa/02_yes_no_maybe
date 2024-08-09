import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF29BBE7);
const List<Color> _colorsThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.pink,
  Colors.yellow,
  Colors.green,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0 && selectedColor <= _colorsThemes.length - 1,
            'Colors themes not found');

  ThemeData theme() {
    if (isDarkMode) {
      return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorsThemes[selectedColor],
        brightness: Brightness.dark,
      );
    }
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorsThemes[selectedColor],
    );
  }
}
