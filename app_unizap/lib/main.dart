import 'package:app_unizap/navigation/routes.dart';
import 'package:app_unizap/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const UniZap());
}

class UniZap extends StatelessWidget {
  const UniZap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.title,
      routes: Routes.routes,
      initialRoute: Constants.signInRoute,
    );
  }
}