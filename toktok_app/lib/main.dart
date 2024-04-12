import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toktok_app/navigation_container.dart';

import 'pages/sign_in_option_page.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toktok Clone App',
      theme: ThemeData(
        textTheme: GoogleFonts.varelaRoundTextTheme(),
      ),
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in-options': (context) => SignInOptionPage(),
        // '/sign-in': (context) => SignInPage(),
        // '/sign-up': (context) => SignUpPage(),
        '/home': (context) => NavigationContainer()
      },
    );
  }
}
