import 'package:flutter/material.dart';
import 'package:pitchbox/layouts/orDivider.dart';
import 'package:pitchbox/layouts/socialIcon.dart';

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
