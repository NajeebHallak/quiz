import 'package:hive/hive.dart';
import 'package:quiz/core/utils/constans.dart';

import '../../domain/entities/quiz_entities.dart';

abstract class QuizLocalDataSource {
  QuizEntities fetchOneQuestion({required int index});
}

class QuizLocalDataSourceImpl extends QuizLocalDataSource {
  @override
  QuizEntities fetchOneQuestion({required int index}) {
    Box<QuizEntities> box = Hive.box<QuizEntities>(Constans.boxQuizEntitie);
    return box.values.elementAt(index);
  }
}
