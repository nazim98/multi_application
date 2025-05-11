import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color bgColor = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      color: bgColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bgColor = Colors.red;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
                fixedSize: Size(100, 40),
              ),
              child: Text(
                'Red',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bgColor = Colors.green;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
                fixedSize: Size(100, 40),
              ),
              child: Text(
                'Green',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bgColor = Colors.blue;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                fixedSize: Size(100, 40),
              ),
              child: Text(
                'Blue',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
