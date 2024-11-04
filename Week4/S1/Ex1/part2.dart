import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(title: 'Hello', icon: Icons.abc),
              HobbyCard(title: 'Hi', icon: Icons.abc),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? bgColor;
  const HobbyCard(
      {super.key,
      required this.title,
      required this.icon,
      this.bgColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 30, bottom: 30, right: 20),
              child: Icon(icon),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
