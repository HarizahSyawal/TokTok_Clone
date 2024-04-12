// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Delay the navigation using Future.delayed
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to '/home' after 2 seconds
      navigateToHome();
    });
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, '/sign-in-options');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 230,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_splash.jpg'),
                ),
              ),
            ),
            SizedBox(
              height: 175.0,
            ),
          ],
        ),
      ),
    );
  }
}
