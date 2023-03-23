import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'accountController.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Acount Page",style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}
