import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  double result = 0;
  double num1 = 0;
  double num2 = 0;
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      color: Colors.teal,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            Wrap(
              spacing: 16.0,
              children: [
                SizedBox(
                  width: 90,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: num1Controller,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: num2Controller,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                Text(
                  '=',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  result.toString(),
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Wrap(
              spacing: 8.0,
              children: [
                displayButton(context, '+'),
                displayButton(context, '-'),
                displayButton(context, 'x'),
                displayButton(context, '/'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget displayButton(BuildContext context, String operator) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          num1 =
              num1Controller.text.isNotEmpty
                  ? double.parse(num1Controller.text)
                  : 0;
          num2 =
              num2Controller.text.isNotEmpty
                  ? double.parse(num2Controller.text)
                  : 0;
          switch (operator) {
            case '+':
              result = num1 + num2;
              break;
            case '-':
              result = num1 - num2;
              break;
            case 'x':
              result = num1 * num2;
              break;
            case '/':
              if (num2 != 0) {
                result = num1 / num2;
              } else {
                result = 0;
              }
              break;
          }
        });
      },
      style: ElevatedButton.styleFrom(fixedSize: Size(80, 40)),
      child: Text(operator, style: TextStyle(fontSize: 24.0)),
    );
  }
}
