import 'package:hexcolor/hexcolor.dart';
import 'package:math_expressions/math_expressions.dart';

import 'package:calculator/screens/calcbuttonpad.dart';
import 'package:calculator/screens/calcscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calc());
}

class Calc extends StatefulWidget {
  @override
  _CalState createState() => _CalState();
}

class _CalState extends State<Calc> {
  String inputText = '0.00';
  List<String> inputTextList = [];
  bool resultGenerated = true;

  @override
  Widget build(BuildContext context) {
    void buttonClicked({String label}) {
      if (resultGenerated) {
        setState(() {
          inputText = '';
          resultGenerated = false;
        });
      }

      if (label == "=") {
        try {
          resultGenerated = true;
          Parser p = Parser();
          Expression exp = p.parse(inputText);
          ContextModel cm = ContextModel();
          String result = exp.evaluate(EvaluationType.REAL, cm).toString();

          if (result.length > 5) {
            result = result.substring(0, 5);
          }

          if (inputTextList.length == 3) {
            inputTextList.removeAt(0);
          }

          setState(() {
            inputTextList.add(inputText);
            inputText = result;
          });

          return;
        } catch (err) {
          print("Error is $err");
          setState(() {
            inputText = "0.00";
          });

          return;
        }
      }

      if (label == 'X') label = '*';

      if (label == "C") {
        setState(() {
          inputText = '0.00';
          resultGenerated = true;
        });
        return;
      }

      setState(() {
        inputText = inputText + label;
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                HexColor("#008EC2"),
                HexColor("#003D52"),
              ],
            ),
            // image: DecorationImage(
            //   image: AssetImage('assets/images/calcbg.jpg'),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Column(
            children: [
              CalcScreen(inputText, inputTextList),
              CalcButtonPad(buttonClicked),
            ],
          ),
        ),
      ),
    );
  }
}
