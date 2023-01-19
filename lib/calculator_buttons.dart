import 'package:flutter/material.dart';

class CalculatorButtons extends StatelessWidget {
  const CalculatorButtons({super.key});

  final List<String> inputs = const [
    '1',
    '2',
    '3',
    '/',
    '4',
    '5',
    '6',
    '*',
    '7',
    '8',
    '9',
    '-',
    '0',
    '.',
    '+',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        crossAxisCount: 4,
        children: List.generate(inputs.length, (index) {
          return TextButton(
              style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(20, 45)))),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 56, 55, 55))),
              onPressed: () => inputs.elementAt(index),
              child: Text(
                inputs.elementAt(index),
                style: const TextStyle(
                    fontSize: 60, color: Colors.white, fontFamily: "Clock"),
              ));
        }));
  }
}
