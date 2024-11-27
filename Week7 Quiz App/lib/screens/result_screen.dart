import 'package:flutter/material.dart';
import 'package:vong_flutter/Week7%20Quiz%20App/lib/model/quiz.dart';
import 'package:vong_flutter/Week7%20Quiz%20App/lib/model/submission.dart';
import 'package:vong_flutter/Week7%20Quiz%20App/lib/screens/question_screen.dart';
import 'package:vong_flutter/Week7%20Quiz%20App/lib/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final Submission submission;
  final VoidCallback onRestart;
  const ResultScreen(
      {super.key,
      required this.quiz,
      required this.submission,
      required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            'you scored ${submission.getScore()} out of ${quiz.questions.length}'),
        const SizedBox(
          height: 30,
        ),
        ...quiz.questions.map(
          (q) => QuestionScreen(
            question: q,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        AppButton('Restart App', onTap: onRestart)
      ],
    );
  }
}
