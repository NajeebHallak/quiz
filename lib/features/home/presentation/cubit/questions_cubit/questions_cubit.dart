import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:quiz/features/home/domain/entities/quiz_entities.dart';
import 'package:quiz/features/home/domain/use_cases/questions_use_case.dart';

import '../../../../../core/errors/failure.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit(this.questionUseCase) : super(QuestionsInitial());

  QuestionUseCase questionUseCase;

  late List<QuizEntities> quizEntities;

  int yourLevel = 0;

  fetchQuestions(
      {required int selectCategory,
      required String selectDifficulty,
      required String type}) async {
    emit(QuestionsLoade());
    Either<Failure, List<QuizEntities>> result =
        await questionUseCase.call(selectCategory, selectDifficulty, type);
    result.fold((failure) {
      emit(QuestionsFailure(failure.errorMassage));
    }, (listQuestions) {
      quizEntities = [];
      quizEntities = listQuestions;
      emit(QuestionsSuccess());
    });
  }
}
