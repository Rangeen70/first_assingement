import 'package:flutter/material.dart';

class Arithmetic extends StatefulWidget {
  @override
  _ArithmeticState createState() => _ArithmeticState();
}

class _ArithmeticState extends State<Arithmetic> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String result = "";

  void performOperation(String operation) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    setState(() {
      switch (operation) {
        case 'Add':
          result = "Sum: ${num1 + num2}";
          break;
        case 'Subtract':
          result = "Difference: ${num1 - num2}";
          break;
        case 'Multiply':
          result = "Product: ${num1 * num2}";
          break;
        case 'Divide':
          result = num2 != 0
              ? "Division: ${num1 / num2}"
              : "Error: Division by zero";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arithmetic Operations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: const InputDecoration(labelText: 'Number 1'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(labelText: 'Number 2'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => performOperation('Add'),
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () => performOperation('Subtract'),
                  child: const Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: () => performOperation('Multiply'),
                  child: const Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () => performOperation('Divide'),
                  child: const Text('Divide'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Arithmetic(),
  ));
}
