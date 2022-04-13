import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/pages/home_page.dart';
import 'package:learning/pages/login_page.dart';
import 'package:learning/utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning Project',
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        "/": (context) => const LoginPage(),
        Routes.homeRoute: (context) => const HomePage(),
        Routes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}
