import 'package:bcommerce/auth/google_sign_in.dart';
import 'package:bcommerce/config.dart';
import 'package:bcommerce/pages/home-two.dart';
import 'package:bcommerce/pages/qr_scanner.dart';
import 'package:bcommerce/pages/test_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return HomeTwo();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something Worng!"),
            );
          } else {
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/background.png'))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Sign In to continue"),
                        Text(
                          'Vegi',
                          style: TextStyle(
                              fontSize: 50,
                              color: text2Color,
                              shadows: [
                                BoxShadow(
                                    spreadRadius: 19,
                                    blurRadius: 0,
                                    color: Colors.green,
                                    offset: Offset(3, 3))
                              ]),
                        ),
                        Column(
                          children: [
                            SignInButton(
                              Buttons.Apple,
                              text: "Sign In with Apple",
                              onPressed: () {},
                            ),
                            SignInButton(
                              Buttons.Google,
                              text: "Sign In with Google",
                              onPressed: () {
                                //Google SignIn
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                provider.googleLogIn();
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "By Pressing SignIn You are agreeing to Our",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            Text(
                              "Terms And Privacy Policy",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
