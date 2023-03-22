import 'dart:async';

// import 'package:blocauth/provider/sign_in_provider.dart';
// import 'package:blocauth/screens/homeScreen.dart';
// import 'package:blocauth/screens/login_screen.dart';
// import 'package:blocauth/utils/config.dart';
// import 'package:blocauth/utils/nextScreen.dart';
import 'package:flutter/material.dart';
import 'package:pitchbox/layouts/signupScreen.dart';
import 'package:provider/provider.dart';

import '../provider/signinProvider.dart';
import '../styles/appIcons.dart';
import 'loginScreen.dart';
import 'nextScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    // create a timer of 2 seconds
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreen(context, const LoginScreen())
          : nextScreen(context, const SignupScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Image(
          image: AssetImage(AppIcons.logo),
          height: 500,
          width: 500,
        )),
      ),
    );
  }
}
