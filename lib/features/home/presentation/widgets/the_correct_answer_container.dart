import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz/core/function/custom_show_dialog_to_win.dart';
import 'package:quiz/core/routers/app_page_name.dart';
import 'package:quiz/core/utils/constans.dart';
import 'package:quiz/features/home/presentation/widgets/custom_container_answer.dart';
import '../cubit/one_question_cubit/one_question_cubit.dart';
import '../cubit/questions_cubit/questions_cubit.dart';

class TheCorrectAnswerContainer extends StatelessWidget {
  const TheCorrectAnswerContainer(
      {super.key,
      required this.theAnswer,
      required this.isWin,
      required this.isLosed,
      required this.confettiController});
  final String theAnswer;
  final bool isWin;
  final bool isLosed;

  final ConfettiController confettiController;
  @override
  Widget build(BuildContext context) {
    int yourLevel = BlocProvider.of<QuestionsCubit>(context).yourLevel;
    return Column(
      children: [
        Material(
          color: isWin || isLosed ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: Colors.blue,
              onTap: !(isWin || isLosed)
                  ? () {
                      playSound();
                      BlocProvider.of<OneQuestionCubit>(context).win();
                      yourLevel == 8
                          ? onTapYouWin(context)
                          : onTapCorrectAnswer(context, yourLevel);
                    }
                  : null,
              child: CustomContainerAnswer(theAnswer: theAnswer)),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  void onTapYouWin(context) {
    Box<int> boxResult = Hive.box(Constans.boxResultsNumber);
    Box<String> boxDate = Hive.box(Constans.boxResultsDate);

    int firstResult = boxResult.get(1)!;
    incrementValue(boxResult, (firstResult + 10), 0);
    int finalResult = boxResult.get(0)!; //ناتج جمع النتيجة في نهاية المرحلة
    if (finalResult < 0) {
      finalResult = 0;
    }
    String theDate =
        '${DateTime.now().year.toString()}-${DateTime.now().month.toString()}-${DateTime.now().day.toString()}';
    String theResult = '${((finalResult * 100) / 90).round()}%';
    String theResultWithDate = '$theDate               $theResult';

    boxDate.put(boxDate.length + 1,
        theResultWithDate); //النتيجة النهائية للمرحلة  مع التاريخ

    confettiController.play();
    BlocProvider.of<OneQuestionCubit>(context).timer.cancel();
  }

  void onTapCorrectAnswer(BuildContext context, int yourLevel) {
    customShowDialogToWin(
      context,
      'Your answer is correct!!',
      () {
        yourLevel++;
        BlocProvider.of<OneQuestionCubit>(context)
            .fetchOneQuestion(index: yourLevel);
        context.pushReplacement(AppPageName.playPage);
      },
      () {
        Box<int> boxResult = Hive.box(Constans.boxResultsNumber);
        incrementValue(boxResult, -10, 1);

        BlocProvider.of<OneQuestionCubit>(context)
            .fetchOneQuestion(index: yourLevel);
        BlocProvider.of<QuestionsCubit>(context).yourLevel--;
        context.pushReplacement(AppPageName.playPage);
      },
    );
    BlocProvider.of<OneQuestionCubit>(context).timer.cancel();
  }

  void incrementValue(Box<int> box, int increase, int who) {
    int currentValue = box.get(who, defaultValue: 0) ?? 0;

    int newValue = currentValue + increase;
    box.put(who, newValue);
  }

  Future<void> playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audio/win.mp3'));
  }
}
