import 'package:app_unizap/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleSignIn extends StatefulWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  State<GoogleSignIn> createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return !_isLoading
        ? SizedBox(
            width: size.width * 0.8,
            height: 45,
            child: OutlinedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.google),
                label: const Text(
                  Constants.textSignInGoogle,
                  style: TextStyle(
                      color: Constants.kBlack, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Constants.kGrey),
                    side:
                        MaterialStateProperty.all<BorderSide>(BorderSide.none)),
                onPressed: () {
                  //paramos aqui
                }))
        : const CircularProgressIndicator();
  }
}
