import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(30),
      child: const Column(
        children: [
          CustomCard(text: 'OOP', colors: [Color.fromARGB(199, 0, 0, 1), Color.fromARGB(200, 55, 55, 185)]),
          SizedBox(height: 20),

          CustomCard(text: 'DART', colors: [Color.fromARGB(199, 0, 0, 1), Color.fromARGB(200, 55, 55, 185)]),
          SizedBox(height: 20),

          CustomCard(text: 'FLutter', colors: [Color.fromARGB(199, 0, 0, 1), Color.fromARGB(200, 55, 55, 185)]),
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  final String text;
  final List<Color> colors;

  const CustomCard({
    super.key,
    required this.text,
    this.colors = const [Colors.blue, Colors.blueAccent]
});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white)
        ),
      ),
    );
  }
}
