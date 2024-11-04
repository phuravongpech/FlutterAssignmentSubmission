import 'package:flutter/material.dart';
import '../widget/gradient_button.dart';

void onPressed() {
  print('hi');
}

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(30),
      child: const Column(
        children: [
          GradientButton(
            text: 'OOP',
            start: Colors.pink,
            end: Colors.purple,
          ),
          SizedBox(height: 20),
          GradientButton(
            text: 'DART',
            start: Colors.pink,
            end: Colors.purple,
          ),
          SizedBox(height: 20),
          GradientButton(
            text: 'FLUTTER',
            start: Colors.pink,
            end: Colors.purple,
          ),
          SizedBox(height: 20),
          TextButton(onPressed: onPressed, child: Text('hello')),
        ],
      ),
    ),
  ));
}
