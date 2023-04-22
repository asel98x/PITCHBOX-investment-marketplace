import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pitchbox/backend/controller/userController.dart';
import 'package:pitchbox/backend/model/mainUser.dart';
import 'package:pitchbox/layouts/newAcc.dart';
import 'package:pitchbox/layouts/signupScreen.dart';
import 'package:pitchbox/layouts/users/Euntrepreneur/pages/dashboard/EunDashboardPage.dart';
import 'package:pitchbox/layouts/users/investors/pages/dashboard/dashboardPage.dart';
import 'package:pitchbox/layouts/users/userCheckScreen.dart';
import 'package:pitchbox/provider/loginDetails.dart';
import 'package:pitchbox/styles/appColors.dart';
import 'package:pitchbox/styles/appStyles.dart';
import 'package:pitchbox/styles/responsiveWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  final String userId;
  const LoginScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginDetails loginDetails = LoginDetails();
  final UserController _userController = UserController();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  bool _isObscure = true; // Initially password is obscured

  void getData()async{
    await loginDetails.getSharedPreferences();
    String? userId = loginDetails.userId;

    // Get user details using the controller class
    List<MainUser> userDetails = await _userController.getUserDetails(userId!);

    // Print user details
    userDetails.forEach((user) {
      print('UserID: ${user.userId}');
      print('UserName: ${user.userName}');
      print('UserEmail: ${user.userEmail}');
      print('UserType: ${user.userType}');
      print('UserPassword: ${user.userPassword}');
    });
  }

  // login function
  void login(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          saveUserDetails(email, password),

        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  void saveUserDetails(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    if (user != null) {
      String userEmail = user.email ?? '';
      String userId = user.uid ?? '';
      String userName = user.displayName ?? '';
      String userPassword = password;
      String userType = ''; // set the user type here

      // Get user details using the controller class
      List<MainUser> userDetails = await _userController.getUserDetails(userId);

      // Check if user is an investor
      bool isInvestor = false;
      userDetails.forEach((user) {
        if (user.userType == 'investor') {
          isInvestor = true;
        }
      });

      if (isInvestor) {
        // Save user details to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userEmail', userEmail);
        prefs.setString('userId', userId);
        prefs.setString('userName', userName);
        prefs.setString('userPassword', userPassword);
        prefs.setString('userType', 'investor');

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => DashboardPage()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => EunDashboardPage()));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool _obscureText = true;


    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context) ? const SizedBox() : Expanded(
              child: Container(
                height: height,
                color: AppColors.mainBlueColor,
                child: Center(
                  child: Text(
                    'P I T C H B O X',
                    style: ralewayStyle.copyWith(
                      fontSize: 48.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(horizontal: ResponsiveWidget.isSmallScreen(context)? height * 0.032 : height * 0.12),
                color: AppColors.backColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.2),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'P I T C H B O X',
                                style: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.blueDarkColor,
                                  fontSize: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.064),

                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('Email',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: AppColors.blueDarkColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Container(
                          child:TextFormField(
                            autofocus: false,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Email");
                              }
                              // reg expression for email validation
                              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please Enter a valid email");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              emailController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                color: AppColors.blueDarkColor,
                              ),
                              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Enter Email",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20.0),
                        SizedBox(height: height * 0.014),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('Password',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: AppColors.blueDarkColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),

                  Container(
                  child: TextFormField(
                  autofocus: false,
                    controller: passwordController,
                    obscureText: _isObscure,
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Password is required for login");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid Password(Min. 6 Character)");
                      }
                    },
                    onSaved: (value) {
                      passwordController.text = value!;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock,
                        color: AppColors.blueDarkColor,),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                  SizedBox(height: height * 0.03),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: ()async{

                            },
                            child: Text('Forgot Password?',
                              style: ralewayStyle.copyWith(
                                fontSize: 12.0,
                                color: AppColors.mainBlueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.05),
                        Center(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                login(emailController.text, passwordController.text);
                              },
                              borderRadius: BorderRadius.circular(16.0),
                              child: Ink(
                                padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: AppColors.mainBlueColor,
                                ),
                                child: Text(
                                  'Login',
                                  style: ralewayStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.whiteColor,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        NewAccount(
                          press: () async{
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return UserCheckScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
