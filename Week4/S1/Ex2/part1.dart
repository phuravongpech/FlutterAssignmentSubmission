import 'package:flutter/material.dart';

const String dartImage = 'assets/images/w4/dart.png';
const String flutterImage = 'assets/images/w4/flutter.png';
const String fireBaseImage = 'assets/images/w4/firebase.png';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue[400],
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(
                  20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            dartImage,
                            width: 100,
                            colorBlendMode: BlendMode.multiply,
                          )
                        ]),
                    const Text(
                      'Dart',
                      style: TextStyle(fontSize: 30),
                    ),
                    const Text('language...')
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(
                  20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            flutterImage,
                            width: 100,
                            colorBlendMode: BlendMode.multiply,
                          )
                        ]),
                    const Text(
                      'Flutter',
                      style: TextStyle(fontSize: 30),
                    ),
                    const Text('language...')
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(
                  20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            fireBaseImage,
                            width: 100,
                            colorBlendMode: BlendMode.multiply,
                          )
                        ]),
                    const Text(
                      'firebase',
                      style: TextStyle(fontSize: 30),
                    ),
                    const Text('language...')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  ));
}
