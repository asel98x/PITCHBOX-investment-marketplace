import 'package:flutter/material.dart';

import 'Euntrepreneur/pages/dashboard/EunDashboardPage.dart';
import 'investors/pages/dashboard/dashboardPage.dart';

class passwordDialog extends StatefulWidget {
  const passwordDialog({Key? key}) : super(key: key);

  @override
  _passwordDialogState createState() => _passwordDialogState();
}

class _passwordDialogState extends State<passwordDialog> {
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;
  late TextEditingController _password1Controller;
  late TextEditingController _password2Controller;

  @override
  void initState() {
    super.initState();
    _password1Controller = TextEditingController();
    _password2Controller = TextEditingController();
  }

  @override
  void dispose() {
    _password1Controller.dispose();
    _password2Controller.dispose();
    super.dispose();
  }

  void _toggleObscurePassword1() {
    setState(() {
      _obscurePassword1 = !_obscurePassword1;
    });
  }

  void _toggleObscurePassword2() {
    setState(() {
      _obscurePassword2 = !_obscurePassword2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _password1Controller,
              obscureText: _obscurePassword1,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword1 ? Icons.visibility : Icons.visibility_off),
                  onPressed: _toggleObscurePassword1,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _password2Controller,
              obscureText: _obscurePassword2,
              decoration: InputDecoration(
                labelText: 'Confirm Password',

              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Perform password validation and submit if valid
                    if (_password1Controller.text == "12") {
                      // Passwords match, submit
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EunDashboardPage(userId: '',)));
                    }else if (_password1Controller.text == "23") {
                      // Passwords match, submit
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardPage(userId: '',)));
                    }
                    else {
                      // Passwords don't match, show error message
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Passwords do not match'),
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
