import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:quiz/features/home/domain/use_cases/one_question_use_case.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/quiz_entities.dart';
part 'one_question_state.dart';

class OneQuestionCubit extends Cubit<OneQuestionState> {
  OneQuestionCubit(this.oneQuestionUseCase) : super(OneQuestionInitial());

  OneQuestionUseCase oneQuestionUseCase;

  late QuizEntities quizEntities;

  late String correctAnswer;

  late List<String> theAnswers;

  late Timer timer;

  fetchOneQuestion({required int index}) {
    emit(OneQuestionLoade());
    Either<Failure, QuizEntities> result = oneQuestionUseCase.call(index);

    result.fold((failure) {
      emit(OneQuestionFailure(failure.errorMassage));
    }, (oneQuestion) {
      quizEntities = oneQuestion;
      correctAnswer = quizEntities.correctAnswer;
      theAnswers = [
        quizEntities.correctAnswer,
        quizEntities.incorrectAnswers[1],
        quizEntities.incorrectAnswers[0],
        quizEntities.incorrectAnswers[2]
      ];
      theAnswers.shuffle();
      emit(OneQuestionSuccess());
    });
  }

  win() {
    emit(OneQuestionWin());
  }

  lose() {
    emit(OneQuestionLose());
  }
}
