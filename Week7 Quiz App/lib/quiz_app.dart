import 'package:flutter/material.dart';
import 'model/submission.dart';
import 'model/quiz.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import 'screens/welcome_screen.dart';

Color appColor = Colors.blue[500] as Color;

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  final Quiz quiz;
  final Submission submission = Submission();
  QuizApp({super.key, required this.quiz});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.notStarted;
  int currentIndex = 0;
  int? answerIndex;

  void onStart() {
    setState(() {
      quizState = QuizState.started;
    });
  }

  void onTap(int answerIndex) {
    setState(() {
      widget.submission.addAnswer(widget.quiz.questions[currentIndex],
          widget.quiz.questions[currentIndex].possibleAnswers[answerIndex]);

      currentIndex++;
      if (currentIndex >= widget.quiz.questions.length) {
        quizState = QuizState.finished;
      }
    });
  }

  void onRestart() {
    setState(() {
      quizState = QuizState.notStarted;
      currentIndex = 0;
      widget.submission.clearUserAnswer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (quizState == QuizState.notStarted)
                WelcomeScreen(
                  quizTitle: widget.quiz.title,
                  onStart: onStart,
                ),
              if (quizState == QuizState.started)
                QuestionScreen(
                  question: widget.quiz.questions[currentIndex],
                  onTap: onTap,
                ),
              if (quizState == QuizState.finished)
                ResultScreen(
                  quiz: widget.quiz,
                  submission: widget.submission,
                  onRestart: onRestart,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
