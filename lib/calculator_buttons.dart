import 'package:flutter/material.dart';

class CalculatorButtons extends StatelessWidget {
  const CalculatorButtons({super.key});

  String number(int index) {
    return "$index";
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        children: List.generate(16, (index) {
          return TextButton(
            onPressed: () => number(index),
            child: Text(number(index)),
          );
        }));
  }
}
