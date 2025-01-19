import 'package:hive/hive.dart';

part 'quiz_entities.g.dart';

@HiveType(typeId: 1)
class QuizEntities {
  @HiveField(0)
  String category;
  @HiveField(1)
  String question;
  @HiveField(2)
  String correctAnswer;
  @HiveField(3)
  List<dynamic> incorrectAnswers;
  @HiveField(4)
  QuizEntities({
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });
}
