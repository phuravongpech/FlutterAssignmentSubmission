import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: Container( 
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(30), 
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.blue[100], borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: const Center(
              child: Text('OOP', style: TextStyle(color: Colors.white),),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: Colors.blue[300], borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: const Center(
              child: Text('DART', style: TextStyle(color: Colors.white),),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:<Color>[
                Colors.blue[200] as Color,
                Colors.blue[600] as Color,
                ]),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: const Center(
              child: Text('FLUTTER', style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    ),
  ));
}
