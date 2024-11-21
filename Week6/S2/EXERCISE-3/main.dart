import 'package:flutter/material.dart';
import 'package:vong_flutter/Week6/S2/EXERCISE-3/screen/temperature.dart';
import 'screen/welcome.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isWelcomePage = true;

  void switchScreen() {
    setState(() {
      isWelcomePage = isWelcomePage ? false : true;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isWelcomePage
              ? Welcome(
                  buttonPressed: switchScreen,
                )
              : Temperature(
                  buttonPressed: switchScreen,
                ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
