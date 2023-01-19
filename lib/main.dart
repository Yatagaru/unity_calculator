import 'package:flutter/material.dart';
import 'package:unity_calculator/calculator_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        color: Color.fromARGB(255, 43, 40, 40),
        title: 'Calculator',
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            body: CalculatorBody()));
  }
}
