import 'package:flutter/material.dart';
import 'package:uniclima/screens/home.dart';
import 'package:uniclima/theme/dark_theme.dart';
import 'package:uniclima/theme/light_theme.dart';

void main() {
  runApp(const UniClima());
}

class UniClima extends StatelessWidget {
  const UniClima({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      title: "UniClima",
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}