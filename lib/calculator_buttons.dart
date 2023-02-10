import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalcButton extends StatelessWidget {
  CalcButton({super.key, required this.onTap, required this.char});

  // CallBack function that will be customized when the object is created
  final Function() onTap;

  // Character that will be shown as an icon
  String char;

  // Condition to check if it is C button (Eraser) or not
  bool isC = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius:
                    isC // If it is the eraser button, he will be shown as a different shape
                        ? const BorderRadius.all(Radius.elliptical(60, 60))
                        : const BorderRadius.all(Radius.elliptical(20, 55)))),
            backgroundColor: MaterialStatePropertyAll(char == "="
                // Button color when the character is "="
                ? const Color.fromARGB(255, 1, 136, 247)
                : char == "/" || char == "X" || char == "-" || char == "+"
                    // Button color when the character is an operator
                    ? const Color.fromARGB(255, 250, 100, 0)
                    : char == "C"
                        // Color when the character is the eraser
                        ? const Color.fromARGB(255, 207, 25, 25)

                        // Color for the rest of the buttons
                        : const Color.fromARGB(255, 32, 31, 31))),

        // On pressed function will be the same as the callback function
        onPressed: () => onTap(),
        child: Text(
          isC == true ? char = "C" : char,
          style: const TextStyle(
              fontSize: 60, color: Colors.white, fontFamily: "Clock"),
        ));
  }
}
