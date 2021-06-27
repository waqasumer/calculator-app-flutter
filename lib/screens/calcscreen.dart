import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  final String inputText;
  final List<String> inputTextList;
  CalcScreen(this.inputText, this.inputTextList);

  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            child: Text(
              widget.inputText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          for (int i = 0; i < widget.inputTextList.length; i++)
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.inputTextList[i],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
