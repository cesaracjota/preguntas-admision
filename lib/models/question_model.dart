import 'topic_model.dart';

class Question {
  final int id;
  final String questionText;
  final String imageUrl;
  final String difficulty;
  final Topic? course;
  final List<String> alternatives;
  final int correctAlternativeIndex;

  Question({
    required this.id,
    required this.questionText,
    this.imageUrl = 'assets/avatar.png',
    this.course,
    required this.difficulty,
    required this.alternatives,
    required this.correctAlternativeIndex,
  });
}
