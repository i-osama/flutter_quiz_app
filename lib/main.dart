import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/pages/login_page.dart';
import 'package:flutter_quiz_app/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,
      theme: TTheme.lightTheme,
      darkTheme: TTheme.darkTheme,
      title: "Quick Quiz",
      home: const LoginPage(),
      // theme: ThemeData(useMaterial3: true);,
    );
  }

}

