import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: const Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 30, left: 30, bottom: 30, right: 20),
                        child: Icon(Icons.travel_explore),
                      ),
                      Text('Traveling'),
                    ],
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: const Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 30, left: 30, bottom: 30, right: 20),
                        child: Icon(Icons.skateboarding),
                      ),
                      Text('Skating'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
