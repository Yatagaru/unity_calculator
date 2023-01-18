import 'package:flutter/material.dart';
import 'package:unity_calculator/calculator_buttons.dart';

class CalculatorBody extends StatelessWidget {
  const CalculatorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          color: const Color.fromARGB(255, 49, 78, 50),
          width: 400,
          height: 100,
          margin: const EdgeInsets.all(40),
          alignment: Alignment.center,
        ),
      ),
      const CalculatorButtons()
    ]);
  }
}
