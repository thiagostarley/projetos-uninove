import 'package:app_unizap/services/firebase_service.dart';
import 'package:app_unizap/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              FirebaseService firebaseService = FirebaseService();
              await firebaseService.signOutFromGoogle().then((value) =>
                  Navigator.pushReplacementNamed(
                      context, Constants.signInRoute));
            },
            icon: const Icon(Icons.logout_rounded))
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Constants.kBlue),
        title: const Text(Constants.textHome),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
              radius: 30,
            ),
            const SizedBox(height: 20),
            Text(user!.displayName!),
            Text(user!.email!),
          ],
        )
      ),
    );
  }
}
