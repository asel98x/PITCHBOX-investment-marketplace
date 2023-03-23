import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitchbox/layouts/users/investors/pages/news/newsController.dart';

class NewsPage extends GetView<NewsController> {
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
