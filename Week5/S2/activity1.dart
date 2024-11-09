import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            color: Colors.blue,
            height: 200,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                  height: 100,
                ),
              ),
              Container(
                color: Colors.pink[200],
                height: 100,
                width: 100,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                color: Colors.yellow[300],
                height: 100,
              )),
              const SizedBox(
                width: 20,
                height: 100,
              ),
              Expanded(
                  child: Container(
                color: Colors.yellow[300],
                height: 100,
              )),
              const SizedBox(
                width: 20,
                height: 100,
              ),
              Expanded(
                  child: Container(
                color: Colors.yellow[300],
                height: 100,
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            color: Colors.pink[400],
          ))
        ],
      ),
    ),
  ));
}
