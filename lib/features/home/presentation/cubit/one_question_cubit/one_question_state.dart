part of 'one_question_cubit.dart';

@immutable
sealed class OneQuestionState {}

final class OneQuestionInitial extends OneQuestionState {}

final class OneQuestionLoade extends OneQuestionState {}

final class OneQuestionSuccess extends OneQuestionState {}

final class OneQuestionFailure extends OneQuestionState {
  final String errorMassage;
  OneQuestionFailure(this.errorMassage);
}

final class OneQuestionWin extends OneQuestionState {}

final class OneQuestionLose extends OneQuestionState {}
