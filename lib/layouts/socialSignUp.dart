import 'package:flutter/material.dart';
import 'package:pitchbox/layouts/orDivider.dart';
import 'package:pitchbox/layouts/socialIcon.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../provider/internetProvider.dart';
import '../provider/signinProvider.dart';
import '../utils/snackBar.dart';
import 'homeScreen.dart';
import 'nextScreen.dart';

class SocialSignUp extends StatelessWidget {
  const SocialSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocalIcon(
            icon: "assets/images/facebook.svg",
            press: () {
              handleFacebookAuth(context);
            },
            ),
            SocalIcon(
              icon: "assets/images/google.svg",
              press: () {
                handleGoogleSignIn(context);
              },
            ),
            SocalIcon(
              icon: "assets/images/twitter.svg",
              press: () {},
            ),
          ],
        ),
      ],
    );
  }

  Future handleGoogleSignIn(BuildContext context) async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                    handleAfterSignIn(context);
              })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                    handleAfterSignIn(context);
              })));
            }
          });
        }
      });
    }
  }

  // handling google sigin in
  Future handleFacebookAuth(BuildContext context) async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
    } else {
      await sp.signInWithFacebook().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                handleAfterSignIn(context);
              })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                handleAfterSignIn(context);
              })));
            }
          });
        }
      });
    }
  }

  // handle after signin
  handleAfterSignIn(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, const HomeScreen());
    });
  }

}
