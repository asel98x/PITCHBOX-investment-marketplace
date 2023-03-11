import 'package:flutter/material.dart';
import 'package:pitchbox/styles/app_colors.dart';

class NewAccount extends StatelessWidget {
  final bool login;
  final Function? press;
  const NewAccount({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(
              color: AppColors.greyColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: AppColors.mainBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
