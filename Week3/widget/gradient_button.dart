import 'package:flutter/material.dart';


class GradientButton extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;

  const GradientButton({
    super.key,
    required this.text,
    this.start = Colors.blue,
    this.end = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [start, end]),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
