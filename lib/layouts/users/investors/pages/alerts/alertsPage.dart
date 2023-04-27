import 'package:flutter/material.dart';

class AlertsPage extends StatefulWidget {
  @override
  _AlertsPageState createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
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
