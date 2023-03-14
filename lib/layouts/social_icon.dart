import 'package:flutter/material.dart';
import 'package:pitchbox/styles/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalIcon extends StatelessWidget {
  final String icon;
  final VoidCallback press;

  const SocalIcon({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      splashColor: AppColors.blueDarkColor.withOpacity(0.1),
      highlightColor: AppColors.greyColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: AppColors.greyColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          icon,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}


