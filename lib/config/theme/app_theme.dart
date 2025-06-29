import 'package:flutter/material.dart';


const colorList = <Color>[
  Color(0xFF6200EE), // Purple
  Color(0xFF03DAC6), // Teal
  Color(0xFFFF5722), // Deep Orange
  Color(0xFF9C27B0), // Purple Accent
  Color(0xFF4CAF50), // Green
  Color(0xFFFFC107), // Amber
  Color(0xFF2196F3), // Blue
  Color(0xFFFF9800), // Orange
  Color(0xFF3F51B5), // Indigo
  Color(0xFF9E9E9E), // Grey
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColor = 0}):assert(
    selectedColor>= 0 && selectedColor < colorList.length,
    'selectedColor must be between 0 and ${colorList.length - 1}',
  );


  ThemeData getTheme()=> ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    brightness: isDarkMode? Brightness.dark: Brightness.light,
    appBarTheme: AppBarTheme(
      centerTitle: true,
    )

  );
}