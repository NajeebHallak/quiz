import 'package:dartz/dartz.dart';
import 'package:quiz/core/errors/failure.dart';
import 'package:quiz/features/home/domain/entities/quiz_entities.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<QuizEntities>>> fetchQuestions(
      {required int selectCategory,
      required String selectDifficulty,
      required String type});
  Either<Failure, QuizEntities> fetchOneQuestion({required int index});
}
