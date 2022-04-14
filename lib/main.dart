import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/pages/home_page.dart';
import 'package:learning/pages/login_page.dart';
import 'package:learning/utils/routes.dart';
import 'package:learning/widgets/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning Project',
      themeMode: ThemeMode.light,
      theme: MyTheme.LigntTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      initialRoute: Routes.homeRoute,
      routes: {
        Routes.loginRoute: (context) => const LoginPage(),
        Routes.homeRoute: (context) => const HomePage(),
      },
    );
  }
}
