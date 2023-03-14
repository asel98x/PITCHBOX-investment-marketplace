import 'package:flutter/material.dart';
import 'package:pitchbox/layouts/or_divider.dart';
import 'package:pitchbox/layouts/social_icon.dart';
import 'package:pitchbox/styles/app_icons.dart';

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
            press: () {},
            ),
            SocalIcon(
              icon: "assets/images/google.svg",
              press: () {},
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
}
