import 'package:dartz/dartz.dart';
import 'package:quiz/core/errors/failure.dart';
import 'package:quiz/core/use_case.dart/use_case.dart';
import 'package:quiz/features/home/domain/entities/quiz_entities.dart';
import 'package:quiz/features/home/domain/repositories/home_repo.dart';

class QuestionUseCase extends UseCase<
    Future<Either<Failure, List<QuizEntities>>>, int, String, String> {
  QuestionUseCase(this.homeRepo);
  HomeRepo homeRepo;
  @override
  Future<Either<Failure, List<QuizEntities>>> call(
      [int? param1, String? param2, String? param3]) {
    return homeRepo.fetchQuestions(
      selectCategory: param1!,
      selectDifficulty: param2!,
      type: param3!,
    );
  }
}
