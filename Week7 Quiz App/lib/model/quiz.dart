class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});

  @override
  String toString() {
    // Represent the quiz with its title and its questions
    return 'Quiz(title: $title, questions: ${questions.map((q) => q.toString()).toList()})';
  }
}

class Question {
  final String title;
  final List<String> possibleAnswers;
  final String correctAnswer;

  const Question({
    required this.title,
    required this.possibleAnswers,
    required this.correctAnswer,
  });

  @override
  String toString() {
    // Represent the question with its title, possible answers, and correct answer
    return 'Question(title: $title, possibleAnswers: $possibleAnswers, correctAnswer: $correctAnswer)';
  }
}
