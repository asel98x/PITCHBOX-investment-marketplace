

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginDetails {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  String? userEmail;
  String? userId;
  String? userName;
  String? userPassword;
  String? userType;

  void setUser(User user) {
    _user = user;
  }

  Future<void> setSharedPreferences() async {
    if (_user != null) {
      userEmail = _user!.email ?? '';
      userId = _user!.uid ?? '';
      userName = _user!.displayName ?? '';
      userPassword = ''; // assuming you're storing the password in a variable called 'password'
      userType = ''; // set the user type here

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userEmail', userEmail!);
      prefs.setString('userId', userId!);
      prefs.setString('userName', userName!);
      prefs.setString('userPassword', userPassword!);
      prefs.setString('userType', userType!);
    }
  }

  Future<void> getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString('userEmail') ?? '';
    userId = prefs.getString('userId') ?? '';
    userName = prefs.getString('userName') ?? '';
    userPassword = prefs.getString('userPassword') ?? '';
    userType = prefs.getString('userType') ?? '';

    // Do something with the retrieved values here
  }
}

