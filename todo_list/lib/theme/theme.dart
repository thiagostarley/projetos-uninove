import 'package:flutter/material.dart';

ThemeData darkTheme(){
  return ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: Colors.black, 
      secondary: Colors.orange
    ),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(color: Colors.white12),
    scaffoldBackgroundColor: Colors.grey[700],
    iconTheme: const IconThemeData(color: Colors.white),
    hintColor: Colors.orange,
    floatingActionButtonTheme: 
      const FloatingActionButtonThemeData(backgroundColor: Colors.white70)
  );
}

ThemeData lightTheme(){
  return ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: Colors.purple, 
      secondary: Colors.orange
    ),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: Colors.pinkAccent),
    scaffoldBackgroundColor: Colors.grey[100],
    iconTheme: const IconThemeData(color: Colors.white),
    hintColor: Colors.orange,
    floatingActionButtonTheme: 
      const FloatingActionButtonThemeData(backgroundColor: Colors.orange)
  );
}