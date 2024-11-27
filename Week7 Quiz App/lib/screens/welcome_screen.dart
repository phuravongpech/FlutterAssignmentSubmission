import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final String quizTitle;
  final VoidCallback onStart;
  const WelcomeScreen(
      {super.key, required this.quizTitle, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/w7/quiz-logo.png',
          height: 250,
        ),
        Text(
          quizTitle,
          style: const TextStyle(color: Colors.white, fontSize: 50),
        ),
        const SizedBox(
          height: 30,
        ),
        AppButton(
          'Start Quiz',
          onTap: onStart,
          icon: Icons.arrow_forward,
        )
      ],
    );
  }
}
