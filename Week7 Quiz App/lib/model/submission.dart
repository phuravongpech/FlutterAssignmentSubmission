import 'quiz.dart';

class Answer {
  final String? userInputAnswer;
  // final Quiz quiz;
  final Question question;

  Answer({required this.userInputAnswer, required this.question});

  bool isCorrect(Question question) {
    return userInputAnswer == question.correctAnswer;
  }

  @override
  String toString() {
    return '$userInputAnswer';
  }
}

class Submission {
  // final Quiz quiz;
  // final Answer userInputAnswer;
  final Map<Question, Answer> userAnswer = {};

  // Submission({required this.userAnswer});

  int getScore() {
    int score = 0;
    userAnswer.forEach((question, userInputAnswer) {
      if (userInputAnswer.isCorrect(question)) {
        score++;
      }
    });
    return score;
  }

  Answer? getAnswerFor(Question question) {
    if (userAnswer.containsKey(question)) {
      return userAnswer[question];
    }

    return null;
  }

  void addAnswer(Question question, String? answer) {
    userAnswer[question] = Answer(userInputAnswer: answer, question: question);
  }

  void clearUserAnswer() {
    userAnswer.clear();
  }
}
