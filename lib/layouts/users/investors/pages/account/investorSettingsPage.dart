import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitchbox/layouts/signupScreen.dart';
import 'package:pitchbox/layouts/users/investors/pages/account/stepper/investorCheckout.dart';
import 'package:pitchbox/layouts/users/investors/pages/account/stepper/updateInvestorCheckout.dart';
import 'package:pitchbox/styles/appColors.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/signinProvider.dart';
import '../../../../../styles/appStyles.dart';
import '../../../../../utils/nextScreen.dart';
import '../../../../loginScreen.dart';

class InvestorSettingsPage extends StatefulWidget {
  const InvestorSettingsPage({Key? key}) : super(key: key);
  @override
  _InvestorSettingsPageState createState() => _InvestorSettingsPageState();
}

class _InvestorSettingsPageState extends State<InvestorSettingsPage> {

  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: ralewayStyle.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.blueDarkColor,
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: AppColors.mainBlueColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: ralewayStyle.copyWith(
                    fontSize: 18.0,
                    color: AppColors.blueDarkColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Investor Profile Manage"),
            buildAccountOptionRow(context, "Signup Screen"),
            buildAccountOptionRow(context, "Social"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: AppColors.mainBlueColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: ralewayStyle.copyWith(
                    fontSize: 18.0,
                    color: AppColors.blueDarkColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", true),
            buildNotificationOptionRow("Account activity", true),
            buildNotificationOptionRow("Opportunity", false),
            SizedBox(
              height: 50,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
              onPressed: () {
                sp.userSignOut();
                nextScreenReplace(context, const LoginScreen(userId: '',));
              },
              child: Text(
                  "SIGN OUT",
                  style: TextStyle(fontSize: 16, letterSpacing: 2.2, color: Colors.black)
              ),
            ),

          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: AppColors.textColor),

        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {

        if (title == "Investor Profile Manage") {
          Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateInvestorCheckout(userId: '',)));
        } else if (title == "Signup Screen") {

        } else if (title == "Social") {

        } else if (title == "Language") {

        } else if (title == "Privacy and security") {

        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: AppColors.textColor,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}