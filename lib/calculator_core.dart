import 'package:flutter/material.dart';
import 'package:unity_calculator/calculator_buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorCore extends StatefulWidget {
  const CalculatorCore({super.key});

  @override
  State<CalculatorCore> createState() => _CalculatorCoreState();
}

class _CalculatorCoreState extends State<CalculatorCore> {
  String _expression = "0"; // Expression that will be made by user inputs
  String _result = ""; // Final result of the expression
  double _expressionSize = 50; // Expression text size
  double _resultSize = 35; // Result text size
  int _expressionAlpha = 255; // Opacity of expression text
  int _resultAlpha = 125; // Opacity of result text

  handleTap(String buttonText) {
    setState(() {
      // Checking if the user pressed the erase button
      // If he pressed, the expression is reseted and the result vanishes
      if (buttonText == "C") {
        _expression = "0";
        _result = "0";
        handleText(50, 35, 255, 0); // Highlighting expression text

        // If the user finishes the calculation, the final result will be shown below him with evalExpression function
      } else if (buttonText == "=") {
        _result = evalExpression(_expression);

        // If the result don´t says error, then the text will shift to be highlighted
        if (_result != "Error") {
          handleText(35, 50, 125, 255); // Highlighting result text
        }

        // If the expression don´t show an error, the code below will be executed
      } else if (_expression != "Error") {
        _expression ==
                "0" // If expression is equal 0, then the next input will substitute it
            ? _expression = buttonText
            : _expression +=
                buttonText; // If not, then the text will be concatenated
        handleText(50, 35, 255, 125); // Highlighting expression text
      }
    });
  }

  // Function to highlight expression or result
  handleText(double expressionSize, double resultSize, int expressionAlpha,
      int resultAlpha) {
    setState(() {
      _expressionSize = expressionSize;
      _resultSize = resultSize;
      _expressionAlpha = expressionAlpha;
      if (_result != "0") {
        _resultAlpha = resultAlpha;
      } else {
        _resultAlpha = 0;
      }
    });
  }

// Function that forces an error to happen
  String handleError() {
    _result = "";
    handleText(50, 35, 255, 0);
    return _expression = "Error";
  }

// Function that parses the expression string and calculates
  String evalExpression(String expression) {
    try {
      Parser p = Parser(); // Parser object
      Expression exp = p.parse(
          expression); // Expression that will be parsed by the parse object
      ContextModel cm = ContextModel(); // Reading expression
      return exp
          .evaluate(EvaluationType.REAL, cm)
          .toString(); // Returning the final calculation as text

      // If an error happens
    } catch (e) {
      return handleError(); // Handle error function
    }
  }

// Build function that will show the buttons, input pad, text and others
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          width: 500,
          height: 120,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.only(
            right: 15,
          ),
          alignment: Alignment.center,
          child: Stack(children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                _expression,
                style: TextStyle(
                    fontSize: _expressionSize,
                    fontFamily: "Clock",
                    color: Color.fromARGB(_expressionAlpha, 0, 0, 0)),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                _result,
                style: TextStyle(
                    fontSize: _resultSize,
                    fontFamily: "Clock",
                    color: Color.fromARGB(_resultAlpha, 0, 0, 0)),
              ),
            ),
          ]),
        ),
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: CalcButton(
            onTap: () => handleTap("C"),
            char: "C",
          )),
      GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        crossAxisCount: 4,
        children: [
          CalcButton(onTap: () => handleTap("1"), char: "1"),
          CalcButton(onTap: () => handleTap("2"), char: "2"),
          CalcButton(onTap: () => handleTap("3"), char: "3"),
          CalcButton(onTap: () => handleTap("/"), char: "/"),
          CalcButton(onTap: () => handleTap("4"), char: "4"),
          CalcButton(onTap: () => handleTap("5"), char: "5"),
          CalcButton(onTap: () => handleTap("6"), char: "6"),
          CalcButton(onTap: () => handleTap("*"), char: "X"),
          CalcButton(onTap: () => handleTap("7"), char: "7"),
          CalcButton(onTap: () => handleTap("8"), char: "8"),
          CalcButton(onTap: () => handleTap("9"), char: "9"),
          CalcButton(onTap: () => handleTap("-"), char: "-"),
          CalcButton(onTap: () => handleTap("0"), char: "0"),
          CalcButton(onTap: () => handleTap("."), char: ","),
          CalcButton(onTap: () => handleTap("="), char: "="),
          CalcButton(onTap: () => handleTap("+"), char: "+"),
        ],
      )
    ]);
  }
}
