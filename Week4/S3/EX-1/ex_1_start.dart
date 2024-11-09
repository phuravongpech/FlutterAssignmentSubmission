import 'package:flutter/material.dart';

enum Status {
  selected(
      textLabel: 'Selected',
      textColor: Colors.white,
      bgColor: Colors.blueAccent),
  notSelected(
      textLabel: 'Not Selected',
      textColor: Colors.black,
      bgColor: Colors.lightBlueAccent);

  final String textLabel;
  final Color textColor;
  final Color bgColor;

  const Status({
    required this.textLabel,
    required this.textColor,
    required this.bgColor,
  });
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(child: Button()),
      ),
    ));

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Status _buttonStatus = Status.selected;

  void buttonClicked() {
    setState(() {
      _buttonStatus = (_buttonStatus == Status.selected)
          ? Status.notSelected
          : Status.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () => {buttonClicked()},
        style: ElevatedButton.styleFrom(
          backgroundColor: _buttonStatus.bgColor,
        ),
        child: Center(
          child: Text(
            _buttonStatus.textLabel,
            style: TextStyle(color: _buttonStatus.textColor),
          ),
        ),
      ),
    );
  }
}
