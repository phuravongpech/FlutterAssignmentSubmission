// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'quiz_app.dart';

import 'package:vong_flutter/Week7%20Quiz%20App/lib/model/submission.dart';

import 'model/quiz.dart';

void main() {
  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["ronan", "hongly", 'leangsiv'],
      correctAnswer: 'ronan');
  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["blue", "red", 'green'],
      correctAnswer: 'red');

  List<Question> myQuestions = [q1, q2];
  Quiz myQuiz = Quiz(title: "Mobile", questions: myQuestions);

  print(myQuiz);

  // Answer a1 = Answer(userInputAnswer: 'ronan', question: q1);
  // Answer a2 = Answer(userInputAnswer: 'red', question: q2);

  Submission s1 = Submission();

  s1.addAnswer(q1, 'ronan');
  s1.addAnswer(q2, 'red');

  print(s1.getAnswerFor(q2));

  print(s1.getScore());
  runApp(QuizApp(
    quiz: myQuiz,
  ));
}
