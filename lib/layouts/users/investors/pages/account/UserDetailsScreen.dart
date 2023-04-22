import 'package:flutter/material.dart';
import 'package:pitchbox/backend/controller/userController.dart';
import 'package:pitchbox/backend/model/mainUser.dart';
import 'package:pitchbox/provider/loginDetails.dart';

class UserDetailsScreen extends StatelessWidget {
  final LoginDetails loginDetails = LoginDetails();
  final UserController _userController = UserController();
  late final String userId;

  UserDetailsScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Details'),
          onPressed: () async {
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
          },
        ),
      ),
    );
  }
}
