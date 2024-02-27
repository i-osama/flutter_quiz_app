// import 'dart:js';

import 'package:flutter/material.dart';

class ThColors{
  ThColors._();

  // static ColorScheme colorLight = ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface)
  static const Color primary = Colors.deepOrange;
  static const Color secondary = Color.fromARGB(100,0, 53, 85);

  static const Color primaryDark =  Color.fromARGB(255, 176, 90, 47);
  static const Color secondaryDark = Color.fromARGB(100, 6, 158, 252);

  static Color? getThemedColor(BuildContext context, String colorName){
    final Brightness brightness = MediaQuery.platformBrightnessOf(context);
    // bool isDarkMode = brightness == Brightness.dark;
    if(brightness == Brightness.light){
      return _lightModeColors(colorName);
    }
    else{
      return _darkModeColors(colorName);
    }

  }

  static Color? _lightModeColors(String colorName) {

    final Map<String, Color> customColors = {
      'white': Colors.white,
      'black': Colors.black,

      // Add more color entries as needed
    };
    if (customColors.containsKey(colorName)){
      return customColors[colorName];
    }
    else {
      return Colors.red;
    }

  }

  static Color? _darkModeColors(String colorName) {
    final Map<String, Color> customColors = {
      'white': Colors.black,
      'black': Colors.white,
      // Add more color entries as needed
    };
    if (customColors.containsKey(colorName)){
      return customColors[colorName];
    }
    else {
      return Colors.red;
    }
  }


}