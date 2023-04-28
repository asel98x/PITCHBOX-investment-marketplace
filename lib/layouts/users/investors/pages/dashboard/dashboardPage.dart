import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitchbox/layouts/users/investors/pages/Investments/investments.dart';
import 'package:pitchbox/layouts/users/investors/pages/account/userProfilePage.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:pitchbox/layouts/users/investors/pages/startups/businessList.dart';
import 'package:pitchbox/styles/appColors.dart';


class DashboardPage extends StatefulWidget {
  final String userId;
  const DashboardPage({Key? key, required this.userId}) : super(key: key);
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>{

  int _currentIndex = 0;
  late PageController _pageController;

  final List<Widget> _pages = [BusinessListPage(), investments(investmentId: '',), userProfilePage(userId: '',)];

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
                title: Text("Investment",
                  style: TextStyle(
                    color: AppColors.blueDarkColor,
                  ),
                ),
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
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


