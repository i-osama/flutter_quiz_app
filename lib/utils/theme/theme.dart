import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/utils/constants/colors.dart';
import 'package:flutter_quiz_app/utils/theme/custom_theme/input_data_theme.dart';
import 'package:flutter_quiz_app/utils/theme/custom_theme/text_theme.dart';

class TTheme {
  TTheme._();


  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: ThColors.primary, centerTitle: true,
        titleTextStyle:  TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: ThColors.primary,
    // colorScheme: ColorScheme(),
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: 'Poppins',
    textTheme: TTextTheme.textThemeLight,
    // colorScheme: ,

    textSelectionTheme: const TextSelectionThemeData(cursorColor: ThColors.primary),
    inputDecorationTheme: ThInputDataTheme.inputThemeLight,
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: ThColors.primaryDark, centerTitle: true,
        titleTextStyle:  TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),

    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: ThColors.primaryDark,
    scaffoldBackgroundColor: Colors.black26,
    // fontFamily: 'Poppins',
    textTheme: TTextTheme.textThemeDark,

    textSelectionTheme: const TextSelectionThemeData(cursorColor: ThColors.primaryDark),
    inputDecorationTheme: ThInputDataTheme.inputThemeDark,
  );
}