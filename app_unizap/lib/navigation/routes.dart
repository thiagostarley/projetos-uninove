import 'package:app_unizap/screens/home_screen.dart';
import 'package:app_unizap/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context) => const LoginScreen(),
    '/home' : (context) => const Home()
  };
}
