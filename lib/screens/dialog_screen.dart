import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  TextEditingController inputController = TextEditingController();
  String input = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent,
      margin: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.0,
          children: [
            input.isEmpty
                ? Text(
                  'Tell Me Something',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
                : SizedBox(
                  width: 200,
                  height: 50,
                  child: Text(
                    input,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text('Apa Khabar?'),
                        content: TextField(
                          controller: inputController,
                          decoration: InputDecoration(
                            label: Text('Type something cool'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                input = inputController.text;
                              });
                              inputController.clear();
                              Navigator.pop(context);
                            },
                            child: Text('Submit'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      ),
                );
              },
              child: Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
