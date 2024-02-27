import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ThInputDataTheme{
  ThInputDataTheme._();
  static InputDecorationTheme inputThemeLight = const InputDecorationTheme(
  border: OutlineInputBorder(),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ThColors.primary),),
      errorStyle: TextStyle(color: Colors.red),
      floatingLabelStyle: TextStyle(color: ThColors.primary,
          fontSize: 18
      ));
  static InputDecorationTheme inputThemeDark = const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ThColors.primaryDark), ), errorStyle: TextStyle(color: Colors.yellow),
      floatingLabelStyle: TextStyle(color: ThColors.primaryDark,
          fontSize: 18
      ));
}
