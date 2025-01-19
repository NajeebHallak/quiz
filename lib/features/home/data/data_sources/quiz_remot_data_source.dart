import 'package:hive/hive.dart';
import 'package:quiz/core/utils/api_services.dart';
import 'package:quiz/features/home/domain/entities/quiz_entities.dart';
import '../../../../core/function/method_assign_api_to_list.dart';
import '../../../../core/utils/constans.dart';

abstract class QuizRemotDataSource {
  Future<List<QuizEntities>> fetchQuestions(
      {required int selectCategory,
      required String selectDifficulty,
      required String type});
}

class QuizRemotDataSourceImpl extends QuizRemotDataSource {
  QuizRemotDataSourceImpl(this.api);
  Api api;
  @override
  Future<List<QuizEntities>> fetchQuestions(
      {required int selectCategory,
      required String selectDifficulty,
      required String type}) async {
    Map<String, dynamic> theData = await api.get(
        endPoint:
            'amount=9&category=$selectCategory&difficulty=$selectDifficulty&type=$type');
    List<QuizEntities> quizEntities = methodAssignApiToList(theData);
    Box<QuizEntities> box = Hive.box<QuizEntities>(Constans.boxQuizEntitie);
  
    box.addAll(quizEntities);
    print(box.values.elementAt(2).question);
    return quizEntities;
  }
}
