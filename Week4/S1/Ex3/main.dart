import 'package:flutter/material.dart';

enum ButtonType {
  primary(color: Colors.blue),
  secondary(color: Colors.green),
  disabled(color: Colors.grey);

  final Color color;
  const ButtonType({required this.color});
}

enum Position { left, right }

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        child: const Column(
          children: [
            CustomButton(
                label: 'hi', icon: Icons.cabin, type: ButtonType.primary),
            CustomButton(
              label: 'hello',
              icon: Icons.headphones,
              type: ButtonType.secondary,
              position: Position.right,
            ),
            CustomButton(
              label: 'hello',
              icon: Icons.do_disturb_alt,
              type: ButtonType.disabled,
              position: Position.right,
            ),
            CustomButton(
              label: 'sei hg',
              icon: Icons.do_disturb_alt,
              type: ButtonType.disabled,
              position: Position.right,
            ),
          ],
        ),
      ),
    ),
  ));
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType type;
  final Position position;

  const CustomButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.type,
      this.position = Position.left});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: type.color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: position == Position.left
            ? [Icon(icon), const SizedBox(width: 8), Text(label)]
            : [Text(label), const SizedBox(width: 8), Icon(icon)],
      ),
    );
  }
}
