import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pitchbox/backend/controller/IndustryController.dart';
import 'package:pitchbox/backend/controller/startupController.dart';
import 'package:pitchbox/backend/controller/userController.dart';
import 'package:pitchbox/backend/controller/userInvestmentController.dart';
import 'package:pitchbox/backend/model/businessModel.dart';
import 'package:pitchbox/backend/model/industry.dart';
import 'package:pitchbox/backend/model/mainUser.dart';
import 'package:pitchbox/backend/model/userInvestment.dart';
import 'package:pitchbox/layouts/users/Euntrepreneur/pages/businessList/updateEunBusinessList.dart';
import 'package:pitchbox/layouts/users/investors/pages/startups/list view.dart';
import 'package:pitchbox/provider/loginDetails.dart';
import 'package:pitchbox/styles/appColors.dart';
import 'package:pitchbox/styles/appStyles.dart';

class investments extends StatefulWidget {
  final String investmentId;
  const investments({Key? key, required this.investmentId}) : super(key: key);
  //const investments({Key? key}) : super(key: key);

  @override
  _investmentsState createState() => _investmentsState();
}

class _investmentsState extends State<investments> {
  final BusinessController _controller = BusinessController();
  final userInvesmentController _investmentController = userInvesmentController();
  final IndustryController _industryController = IndustryController();
  final TextEditingController _searchController = TextEditingController();
  final LoginDetails loginDetails = LoginDetails();
  final UserController _userController = UserController();

  List<Business> _businessList = [];

  List<userInvestment> _investmentList = [];
  //late userInvestment uInvestment;
  late Business business;

  File? _imageFile;
  File? _imageFile2;

  @override
  void initState() {
    super.initState();
    _loadInvestmentList();
  }


  Future<void> _loadInvestmentList() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    String Id = user?.uid ?? '';
    List<userInvestment> investmentList = await _investmentController.getInvestmentList(Id);
    setState(() {
      _investmentList = investmentList;
    });
  }

  void _filterBusinessList(String query) {
    List<userInvestment> filterInvestmentList = _investmentList
        .where((investment) =>
        investment.businessName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _investmentList = filterInvestmentList;
    });
  }

  Future<void> _handleRefresh() async {
    _loadInvestmentList();
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Container(
          color: Colors.grey[200], // set the background color to gray
          child: Scaffold(
            appBar: AppBar(
              title: Text('My Investments'),
              backgroundColor: AppColors.mainBlueColor,
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search Business name',
                      hintText: 'Enter a Business name',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      _filterBusinessList(value);
                    },
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _handleRefresh,
                    child: _investmentList.isEmpty
                        ? Center(
                      child: Text('No Investments available'),
                    )
                        : ListView.builder(
                      itemCount: _investmentList.length,
                      itemBuilder: (context, index) {
                        userInvestment investment = _investmentList[index];
                        return GestureDetector(
                          onTap: () {
                            //_showLoanDetailsDialog(context, investment);
                          },
                          onLongPress: () {},
                          child: Card(
                            margin: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Business name : ' +
                                            investment.businessName,
                                        style: ralewayStyle.copyWith(
                                          fontSize: 16,
                                          color: AppColors.greyColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        'Investment :\$' +
                                            investment.investedAmount,
                                        style: ralewayStyle.copyWith(
                                          fontSize: 20.0,
                                          color: AppColors.blueDarkColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       return EunBusinessListView(businessId: loan.businessId,);
                                      //     },
                                      //   ),
                                      // );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.mainBlueColor,
                                    ),
                                    child: Text(
                                      'Start-up Information',
                                      style: ralewayStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.whiteColor,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}