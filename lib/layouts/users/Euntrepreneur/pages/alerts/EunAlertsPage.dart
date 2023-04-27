import 'package:flutter/material.dart';

class EunAlertsPage extends StatefulWidget {
  @override
  _EunAlertsPageState createState() => _EunAlertsPageState();
}

class _EunAlertsPageState extends State<EunAlertsPage> {
  double _number = 0;

  void _incrementNumber() {
    setState(() {
      _number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
          _incrementNumber();
        }
      },
      child: Text(
        '$_number',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
