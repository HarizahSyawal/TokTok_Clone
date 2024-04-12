// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SignInOptionPage extends StatefulWidget {
  const SignInOptionPage({Key? key}) : super(key: key);

  @override
  State<SignInOptionPage> createState() => _SignInOptionPageState();
}

class _SignInOptionPageState extends State<SignInOptionPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log in To Candu',
              style: primaryTextStyle.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w600, // Use FontWeight.w600 for semiBold
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Center(
              // Wrap the Text widget with Center
              child: Text(
                'Manage your account, check notification, comment on videos and more.',
                style: subtitleTextStyle,
                textAlign: TextAlign.center, // Optionally, align text center
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
          ],
        ),
      );
    }

    Widget buildSquareOutlinedButton(
        String label, IconData iconData, VoidCallback onPressed) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            side: BorderSide(
              color: Colors.white,
              width: 1,
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Colors.grey,
              ),
              SizedBox(width: 10), // Add spacing between icon and text
              Expanded(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget signInOptions() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSquareOutlinedButton(
                "Use phone or email", Icons.account_circle, () {
              // Add onPressed logic for button 1
            }),
            SizedBox(height: 10),
            buildSquareOutlinedButton("Continue with Facebook", Icons.facebook,
                () {
              // Add onPressed logic for button 2
            }),
            SizedBox(height: 10),
            buildSquareOutlinedButton("Continue with Apple", Icons.apple, () {
              // Add onPressed logic for button 3
            }),
            SizedBox(height: 10),
            buildSquareOutlinedButton(
                "Continue with Google", Icons.g_mobiledata_rounded, () {
              // Add onPressed logic for button 4
            }),
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account ?',
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/sign-up'),
              child: Text(
                'Log In',
                style: alertTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor1,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              header(),
              signInOptions(),
              Spacer(),
              footer(),
            ]),
          ),
        ));
  }
}
