import 'package:flutter/material.dart';
import 'package:vong_flutter/Week7%20Quiz%20App/lib/model/quiz.dart';
// import 'package:vong_flutter/Week7/lib/model/submission.dart';
import 'package:vong_flutter/Week7%20Quiz%20App/lib/widgets/app_button.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  // final Answer? answer;
  final void Function(int)? onTap;
  // int index = 0;
  const QuestionScreen({super.key, required this.question, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(question.title),
        const SizedBox(
          height: 30,
        ),
        for (var i = 0; i < question.possibleAnswers.length; i++)
          AppButton(question.possibleAnswers[i], onTap: () => onTap!(i)),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
