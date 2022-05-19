import 'package:app_unizap/utils/constants.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Constants.kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: Constants.textSignInTitle,
                    style: TextStyle(
                      color: Constants.kBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    )
                  )
                ]
              )
            ),
            SizedBox(height: size.height * 0.06),
            const Text(
              Constants.textSmallSignIn,
              style: TextStyle(color: Constants.kGreyDark),
            ),
            SizedBox(height: size.height * 0.02),
            
          ],
        )
      ),
    );
  }
}