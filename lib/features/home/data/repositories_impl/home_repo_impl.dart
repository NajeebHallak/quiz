import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:quiz/core/errors/failure.dart';
import 'package:quiz/core/utils/constans.dart';
import 'package:quiz/features/home/data/data_sources/quiz_local_data_source.dart';
import 'package:quiz/features/home/data/data_sources/quiz_remot_data_source.dart';
import 'package:quiz/features/home/domain/entities/quiz_entities.dart';
import 'package:quiz/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl(this.quizLocalDataSource, this.quizRemotDataSource);

  QuizLocalDataSource quizLocalDataSource;

  QuizRemotDataSource quizRemotDataSource;

  @override
  Future<Either<Failure, List<QuizEntities>>> fetchQuestions(
      {required int selectCategory,
      required String selectDifficulty,
      required String type}) async {
    try {
      Box<QuizEntities> box = Hive.box<QuizEntities>(Constans.boxQuizEntitie);
      if (selectCategory == 0 &&
          selectDifficulty == '' &&
          type == '' &&
          box.isNotEmpty) {
        List<QuizEntities> quizEntities = [];
        quizEntities = box.values.toList();
        return right(quizEntities);
      }
      List<QuizEntities> quizEntities = [];
      quizEntities = await quizRemotDataSource.fetchQuestions(
          selectCategory: selectCategory,
          selectDifficulty: selectDifficulty,
          type: type);
      return right(quizEntities);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Either<Failure, QuizEntities> fetchOneQuestion({required int index}) {
    try {
      QuizEntities quizEntities =
          quizLocalDataSource.fetchOneQuestion(index: index);
      return right(quizEntities);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
