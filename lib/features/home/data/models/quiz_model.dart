import 'package:quiz/features/home/domain/entities/quiz_entities.dart';

class QuizModel extends QuizEntities {
  String type;
  String difficulty;
  String category1;
  String question1;
  String correctAnswer1;
  List<dynamic> incorrectAnswers1;

  QuizModel({
    required this.type,
    required this.difficulty,
    required this.category1,
    required this.question1,
    required this.correctAnswer1,
    required this.incorrectAnswers1,
  }) : super(
            category: category1,
            question: question1,
            correctAnswer: correctAnswer1,
            incorrectAnswers: incorrectAnswers1);

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        type: json['type'] as String,
        difficulty: json['difficulty'] as String,
        category1: json['category'] as String,
        question1: json['question'] as String,
        correctAnswer1: json['correct_answer'] as String,
        incorrectAnswers1: json['incorrect_answers'] as List<dynamic>,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'difficulty': difficulty,
        'category': category1,
        'question': question1,
        'correct_answer': correctAnswer1,
        'incorrect_answers': incorrectAnswers1,
      };
}
