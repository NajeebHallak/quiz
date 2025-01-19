import 'package:dartz/dartz.dart';
import 'package:quiz/core/errors/failure.dart';
import 'package:quiz/core/use_case.dart/use_case.dart';
import 'package:quiz/features/home/domain/entities/quiz_entities.dart';
import 'package:quiz/features/home/domain/repositories/home_repo.dart';

class OneQuestionUseCase
    extends UseCase<Either<Failure, QuizEntities>, int, NoData, NoData> {
  OneQuestionUseCase(this.homeRepo);
  HomeRepo homeRepo;

  @override
  Either<Failure, QuizEntities> call(
      [int param1 = 0, NoData? param2, NoData? param3]) {
    return homeRepo.fetchOneQuestion(index: param1);
  }
}
