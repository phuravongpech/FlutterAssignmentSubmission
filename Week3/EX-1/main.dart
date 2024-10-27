import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Color.fromARGB(205, 247, 207, 220),
      body: Center(
        child: Text('hello my name is vong!',
          style: TextStyle(color: Colors.orange, fontSize: 50)),
      ),
    ),
  ));
}
