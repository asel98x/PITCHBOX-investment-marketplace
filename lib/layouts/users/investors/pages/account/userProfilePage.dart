import 'package:flutter/material.dart';
import 'package:pitchbox/backend/controller/userController.dart';
import 'package:pitchbox/backend/model/mainUser.dart';
import 'package:pitchbox/provider/loginDetails.dart';
import 'package:pitchbox/provider/signinProvider.dart';
import 'package:pitchbox/styles/appColors.dart';
import 'package:pitchbox/styles/appIcons.dart';
import 'package:pitchbox/styles/appStyles.dart';
import 'package:provider/provider.dart';


import 'investorSettingsPage.dart';

class userProfilePage extends StatefulWidget {
  final String userId;
  const userProfilePage({Key? key, required this.userId}) : super(key: key);
  //const userProfilePage({Key? key}) : super(key: key);
  @override
  _userProfilePageState createState() => _userProfilePageState();
}

class _userProfilePageState extends State<userProfilePage> {
  bool showPassword = false;
  final LoginDetails loginDetails = LoginDetails();
  final UserController _userController = UserController();

  String userId = '';
  String userName = '';
  String userEmail = '';
  String userType = '';
  String userPassword = '';

  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  void getData2()async{
    await loginDetails.getSharedPreferences();
    String? userId = loginDetails.userId;

    // Get user details using the controller class
    List<MainUser> userDetails = await _userController.getUserDetails(userId!);

    // Print user details
    MainUser user = userDetails.first;
    userId = user.userId;
    userName = user.userName;
    userEmail = user.userEmail;
    userType = user.userType;
    userPassword = user.userPassword;

    print(userName);
    print(userEmail);
    print(userType);
    print(userPassword);
  }

  @override
  void initState() {
    super.initState();
    getData();
    getData2();
  }


  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 5, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: AppColors.mainBlueColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => InvestorSettingsPage()));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Profile",
                style: ralewayStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.blueDarkColor,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                            image: AssetImage(AppIcons.emptyUser),
                          )
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: AppColors.mainBlueColor,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("UserName", userName, mounted),
              buildTextField("UserEmail", userEmail, mounted),
              buildTextField("UserType", userType, mounted),


            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}