import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/features/home/presentation/widgets/the_correct_answer_container.dart';
import 'package:quiz/features/home/presentation/widgets/the_un_correct_answers_container.dart';
import '../cubit/one_question_cubit/one_question_cubit.dart';

class TheAnswersColumn extends StatelessWidget {
  const TheAnswersColumn({
    super.key,
    required this.isLosed,
    required this.isWin,
    required this.confettiController,
  });
  final bool isLosed;
  final bool isWin;

  final ConfettiController confettiController;

  @override
  Widget build(BuildContext context) {
    List<String> theAnswers =
        BlocProvider.of<OneQuestionCubit>(context).theAnswers;

    String correctAnswer =
        BlocProvider.of<OneQuestionCubit>(context).correctAnswer;

    return Column(
      children: theAnswers.map((element) {
        return element == correctAnswer
            ? TheCorrectAnswerContainer(
                theAnswer: element,
                isLosed: isLosed,
                isWin: isWin,
                confettiController: confettiController)
            : TheUnCorrectAnswersContainer(
                theAnswer: element,
                isLosed: isLosed,
                isWin: isWin,
              );
      }).toList(),
    );
  }
}
