import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/home/presentation/cubit/one_question_cubit/one_question_cubit.dart';
import 'package:quiz/features/home/presentation/widgets/custom_container_answer.dart';
import '../../../../core/function/custom_show_dialog_to_lose.dart';
import '../../../../core/routers/app_page_name.dart';
import '../cubit/questions_cubit/questions_cubit.dart';

class TheUnCorrectAnswersContainer extends StatelessWidget {
  const TheUnCorrectAnswersContainer({
    super.key,
    required this.theAnswer,
    required this.isLosed,
    required this.isWin,
  });
  final String theAnswer;
  final bool isLosed;

  final bool isWin;
  @override
  Widget build(BuildContext context) {
    int yourLevel = BlocProvider.of<QuestionsCubit>(context).yourLevel;
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(15),
          color: isLosed ? Colors.red : Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            splashColor: Colors.blue,
            onTap: !(isWin || isLosed)
                ? () {
                    playSound();
                    onTapUnCorrectAnswers(context, yourLevel);
                  }
                : null,
            child: CustomContainerAnswer(theAnswer: theAnswer),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  void onTapUnCorrectAnswers(BuildContext context, int yourLevel) {
    BlocProvider.of<OneQuestionCubit>(context).lose();
    customShowDialogTolose(
      context,
      'Your answer is wrong 😔!!',
      () {
        BlocProvider.of<OneQuestionCubit>(context)
            .fetchOneQuestion(index: yourLevel);
        context.pushReplacement(AppPageName.playPage);
      },
    );

    BlocProvider.of<OneQuestionCubit>(context).timer.cancel();
  }

  Future<void> playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audio/lose.mp3'));

    //  player.stop();
  }
}
