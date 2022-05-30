import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constants {
  //cores:
  static const kPrimaryColor = Color.fromARGB(255, 230, 230, 230);
  static const kBlack = Color.fromARGB(255, 0, 0, 0);
  static const kGrey = Color.fromARGB(255, 205, 205, 205);
  static const kGreyDark = Color.fromARGB(255, 100, 100, 100);
  static const kBlue = Colors.blue;

  //constantes de navegação:
  static const signInRoute = '/';
  static const homeRoute = '/home';

  //textos úteis:
  static const title = 'UniZap';
  static const textSignInTitle = 'Seja bem-vindo(a)';
  static const textSmallSignIn = 'Escolha abaixo o método de login';
  static const textSignInGoogle = 'Entrar com uma conta Google';
  static const textHome = 'Home';
  static const txtErro = 'Erro';
  static const txtOk = 'Ok';

  static const statusBarColor = SystemUiOverlayStyle(
      statusBarColor: Constants.kPrimaryColor,
      statusBarIconBrightness: Brightness.dark);
}
