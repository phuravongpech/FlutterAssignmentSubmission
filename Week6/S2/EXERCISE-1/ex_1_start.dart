import 'package:flutter/material.dart';

//in terms of readability I think the first and second method are good
//maintanability : the one that uses dedicated function is good for reusability
//in terms of performance, the first and second method are good because no need to define function

List<String> colors = ["red", "blue", "green"];

List<Widget> getColors() {
  return colors.map((color) => Text(color)).toList();
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            for (var i = 0; i < colors.length; i++) Text(colors[i]),
            const Label("Method 2: Map", bold: true),
            ...colors.map((color) => Text(color)),
            const Label("Method 3: Dedicated Function", bold: true),
            ...getColors(),
            //...spread operator cuz getColors return a list of widgets
            //we need to use that in order to spread widgets into each individual commponents
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
