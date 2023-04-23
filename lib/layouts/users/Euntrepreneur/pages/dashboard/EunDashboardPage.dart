import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitchbox/layouts/users/Euntrepreneur/pages/account/EunUserProfilePage.dart';
import 'package:pitchbox/layouts/users/Euntrepreneur/pages/alerts/EunAlertsPage.dart';
import 'package:pitchbox/layouts/users/Euntrepreneur/pages/businessList/EunBusinessList.dart';
import 'package:pitchbox/layouts/users/Euntrepreneur/pages/news/EunNewsPage.dart';
import 'package:pitchbox/layouts/users/investors/pages/account/userProfilePage.dart';
import 'package:pitchbox/layouts/users/investors/pages/alerts/alertsPage.dart';
import 'package:pitchbox/layouts/users/investors/pages/account/accountPage.dart';
import 'package:pitchbox/layouts/users/investors/pages/news/newsPage.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:pitchbox/styles/appColors.dart';


class EunDashboardPage extends StatefulWidget {

  @override
  State<EunDashboardPage> createState() => _EunDashboardPageState();
}

class _EunDashboardPageState extends State<EunDashboardPage>{

  int _currentIndex = 0;
  late PageController _pageController;

  final List<Widget> _pages = [EunBusinessList(userId: '',), EunNewsPage(), EunAlertsPage(), EunUserProfilePage()];

  @override
  void initState(){
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected:(index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text("Startups",
                  style: TextStyle(
                    color: AppColors.blueDarkColor,
                  ),
                ),
                icon: Icon(
                  Icons.account_balance_sharp,
                  color: AppColors.blueDarkColor,)
            ),
            BottomNavyBarItem(
                title: Text("Loan",
                  style: TextStyle(
                    color: AppColors.blueDarkColor,
                  ),
                ),
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: AppColors.blueDarkColor,)
            ),
            BottomNavyBarItem(
                title: Text("Users",
                  style: TextStyle(
                    color: AppColors.blueDarkColor,
                  ),
                ),
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: AppColors.blueDarkColor,)
            ),
            BottomNavyBarItem(
                title: Text("Profile",
                  style: TextStyle(
                    color: AppColors.blueDarkColor,
                  ),
                ),
                icon: Icon(
                  Icons.account_box_outlined,
                  color: AppColors.blueDarkColor,)
            ),
          ]
      ),
    );
  }
}


