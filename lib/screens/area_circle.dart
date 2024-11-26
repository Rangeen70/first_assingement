import 'package:flutter/material.dart';
import 'dart:math';

class AreaOfCircle extends StatefulWidget {
  @override
  _AreaOfCircleState createState() => _AreaOfCircleState();
}

class _AreaOfCircleState extends State<AreaOfCircle> {
  final TextEditingController radiusController = TextEditingController();
  String result = "";

  void calculateArea() {
    double radius = double.tryParse(radiusController.text) ?? 0;
    double area = pi * radius * radius;

    setState(() {
      result = "Area: ${area.toStringAsFixed(2)} square units";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area of Circle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: radiusController,
              decoration: InputDecoration(labelText: 'Radius'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateArea,
              child: Text('Calculate Area of Circle'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AreaOfCircle(),
  ));
}
