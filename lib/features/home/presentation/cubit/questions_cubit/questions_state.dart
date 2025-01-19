part of 'questions_cubit.dart';

@immutable
sealed class QuestionsState {}

final class QuestionsInitial extends QuestionsState {}

final class QuestionsSuccess extends QuestionsState {}

final class QuestionsLoade extends QuestionsState {}

final class QuestionsFailure extends QuestionsState {
  final String errorMassage;
  QuestionsFailure(this.errorMassage);
}
