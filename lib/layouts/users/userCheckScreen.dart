import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pitchbox/layouts/users/investors/pages/dashboard/dashboardPage.dart';
import 'package:pitchbox/layouts/users/passwordDialog.dart';
import 'package:pitchbox/styles/appColors.dart';
import 'package:pitchbox/styles/appIcons.dart';
import 'package:pitchbox/styles/appStyles.dart';

class UserCheckScreen extends StatefulWidget {
  const UserCheckScreen({ Key? key }) : super(key: key);

  @override
  _UserCheckScreenState createState() => _UserCheckScreenState();
}

class _UserCheckScreenState extends State<UserCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 40),
            child: Text(
              'Who you are ....',
              style: ralewayStyle.copyWith(
                fontSize: 48.0,
                color: AppColors.blueDarkColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>passwordDialog()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.mainBlueColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppIcons.entrepreneur, width: 50, height: 50),
                          SizedBox(height: 10),
                          Text("Euntrepreneur",style: TextStyle(color: Colors.white,fontSize: 30),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.mainBlueColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppIcons.investor, width: 50, height: 50),
                          SizedBox(height: 10),
                          Text("Investor",style: TextStyle(color: Colors.white,fontSize: 30),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}