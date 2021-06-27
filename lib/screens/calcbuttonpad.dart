import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CalcButtonPad extends StatefulWidget {
  final Function buttonClicked;

  CalcButtonPad(this.buttonClicked);

  @override
  _CalcButtonPadState createState() => _CalcButtonPadState();
}

class _CalcButtonPadState extends State<CalcButtonPad> {
  @override
  Widget build(BuildContext context) {
    Widget button(
        {String label,
        double width = 70,
        double height = 60,
        String bgColor = '#00FFFFFF',
        double radius = 100}) {
      return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(5),
        child: TextButton(
          onPressed: () {
            widget.buttonClicked(label: label);
          },
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => HexColor(bgColor)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
              )),
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(label: "(", width: 175, bgColor: '#003749'),
              button(label: ")", width: 175, bgColor: '#003749'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      button(label: "7"),
                      button(label: "8"),
                      button(label: "9"),
                    ],
                  ),
                  Row(
                    children: [
                      button(label: "6"),
                      button(label: "5"),
                      button(label: "4"),
                    ],
                  ),
                  Row(
                    children: [
                      button(label: "3"),
                      button(label: "2"),
                      button(label: "1"),
                    ],
                  ),
                  Row(
                    children: [
                      button(label: "0"),
                      button(label: "."),
                      button(label: "C"),
                    ],
                  ),
                ],
              ),
              Column(children: [
                Row(
                  children: [
                    Column(
                      children: [
                        button(
                          label: "-",
                          bgColor: '#15AADB',
                        ),
                        button(
                          label: "+",
                          height: 120,
                          bgColor: '#15AADB',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        button(label: "/", bgColor: '#15AADB'),
                        button(label: "X", bgColor: '#15AADB'),
                        button(label: "%", bgColor: '#15AADB'),
                      ],
                    ),
                  ],
                ),
                button(label: "=", width: 140, bgColor: '#15AADB'),
              ]),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
