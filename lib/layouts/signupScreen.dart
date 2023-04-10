import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pitchbox/backend/model/user.dart';
import 'package:pitchbox/layouts/socialSignUp.dart';
import 'package:pitchbox/styles/appColors.dart';
import 'package:pitchbox/styles/appIcons.dart';
import 'package:pitchbox/styles/appStyles.dart';
import 'package:pitchbox/styles/responsiveWidget.dart';
import 'package:pitchbox/layouts/loginScreen.dart';
import 'package:pitchbox/layouts/newAcc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true; // Initially password is obscured
  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // void userRegister(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: email, password: password)
  //           .then((value) => {postDetailsToFirestore()})
  //           .catchError((e) async {
  //         Fluttertoast.showToast(msg: e!.message);
  //
  //         UserCredential userCredential = await FirebaseAuth.instance
  //             .createUserWithEmailAndPassword(email: email, password: password);
  //         User? user = userCredential.user;
  //         print(user);
  //       });
  //     } on FirebaseAuthException catch (error) {
  //       if (error.code == 'weak-password') {
  //         print('The password provided is too weak.');
  //       } else if (error.code == 'email-already-in-use') {
  //         print('The account already exists for that email.');
  //       }
  //       switch (error.code) {
  //         case "invalid-email":
  //           errorMessage = "Your email address appears to be malformed.";
  //           break;
  //         case "wrong-password":
  //           errorMessage = "Your password is wrong.";
  //           break;
  //         case "user-not-found":
  //           errorMessage = "User with this email doesn't exist.";
  //           break;
  //         case "user-disabled":
  //           errorMessage = "User with this email has been disabled.";
  //           break;
  //         case "too-many-requests":
  //           errorMessage = "Too many requests";
  //           break;
  //         case "operation-not-allowed":
  //           errorMessage = "Signing in with Email and Password is not enabled.";
  //           break;
  //         default:
  //           errorMessage = "An undefined Error happened.";
  //       }
  //       Fluttertoast.showToast(msg: errorMessage!);
  //       print(error.code);
  //     }
  //   }
  // }
  // postDetailsToFirestore() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;
  //
  //   UserPro userModel = UserPro(
  //       uId: user!.uid,
  //       name: nameController.text,
  //       email: emailController.text,
  //       mobile: '',
  //       street: '',
  //       city: '',
  //       state: '',
  //       zipCode: '',
  //       country: '',
  //       industry: '',
  //       linkedin: '',
  //       twitter: '',
  //       facebook: '',
  //       instagram: '',
  //       website: '',
  //       provider: '',
  //       imgUrl: '',
  //       pass: confirmPasswordController.text);
  //
  //   await firebaseFirestore
  //       .collection("Admin")
  //       .doc(user.uid) // Use user.uid here as well
  //       .set(userModel.toMap());
  //   Fluttertoast.showToast(msg: "Account created successfully :) ");
  //
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                    'PITCHBOX',
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
                        SizedBox(height: height * 0.10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: ' P I T C H B O X',
                                style: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.blueDarkColor,
                                  fontSize: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: height * 0.054),

                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('Name',
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
                                return ("Please Enter Your Name");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              nameController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                color: AppColors.blueDarkColor,
                              ),
                              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Enter Name",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.014),
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
                        SizedBox(height: height * 0.014),

                        const SizedBox(height: 6.0),
                        Container(
                          height: 50.0,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: AppColors.whiteColor,
                          ),
                            child: TextFormField(
                              autofocus: false,
                              controller: confirmPasswordController,
                              obscureText: _isObscure,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                confirmPasswordController.text = value!;
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
                              ),
                            ),
                        ),



                        SizedBox(height: height * 0.03),

                        Center(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(16.0),
                              child: Ink(
                                padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: AppColors.mainBlueColor,
                                ),
                                child: Text(
                                  'Singup',
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
                        SizedBox(height: defaultPadding / 2),
                        SocialSignUp(),

                        SizedBox(height: height * 0.05),
                        NewAccount(
                          login: false,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
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