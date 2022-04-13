import 'package:flutter/material.dart';
import 'package:learning/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changedButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/login_image.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "welcome $name",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          hintText: "Enter UserName",
                          labelText: "UserName",
                        ),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            changedButton = true;
                          });
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushNamed(context, Routes.homeRoute);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: 45,
                          width: changedButton ? 45 : 145,
                          child: changedButton
                              ? const Icon(Icons.done, color: Colors.white)
                              : const Text(
                                  "LogIn",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius:
                                BorderRadius.circular(changedButton ? 50 : 8),
                            // shape: changedButton
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle,
                          ),
                        ),
                      )
                      // ElevatedButton(
                      //   child: const Text("Log In"),
                      //   style: TextButton.styleFrom(
                      //       minimumSize: const Size(150, 40)),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
