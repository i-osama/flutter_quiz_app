import 'package:flutter/material.dart';

class TTextTheme{
  TTextTheme._();
  static TextTheme textThemeLight = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.00, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: const TextStyle().copyWith(fontSize: 25.00, fontWeight: FontWeight.bold, color: Colors.black),

    bodySmall: const TextStyle().copyWith(fontSize: 16.00,  color: Colors.black)
  );

  static TextTheme textThemeDark = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.00, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle().copyWith(fontSize: 25.00, fontWeight: FontWeight.bold, color: Colors.white),


      bodySmall: const TextStyle().copyWith(fontSize: 16.00,  color: Colors.white),
  );
}