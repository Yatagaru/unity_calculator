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
          color: const Color.fromARGB(255, 255, 255, 255),
          width: 500,
          height: 150,
          margin: const EdgeInsets.all(40),
          alignment: Alignment.center,
        ),
      ),
      const CalculatorButtons()
    ]);
  }
}
