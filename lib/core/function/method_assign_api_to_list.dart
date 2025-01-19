import '../../features/home/data/models/quiz_model.dart';
import '../../features/home/domain/entities/quiz_entities.dart';

List<QuizEntities> methodAssignApiToList(Map<String, dynamic> theData) {
  List<QuizEntities> quizEntities = [];
  for (var element in theData["results"]) {
    quizEntities.add(QuizModel.fromJson(element));
    print(element['correct_answer']);
  }
  return quizEntities;
}
