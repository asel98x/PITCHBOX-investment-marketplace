import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "News Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
