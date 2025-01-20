import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz/core/utils/constans.dart';
import 'package:quiz/features/home/presentation/cubit/questions_cubit/questions_cubit.dart';
import 'package:quiz/features/home/presentation/widgets/paly_page_body.dart';
import '../../../../core/function/custom_show_dialog_error.dart';
import '../../../../core/widget/custom_loading_animation_widget.dart';
import '../cubit/one_question_cubit/one_question_cubit.dart';

class PlayBlocConsumer extends StatefulWidget {
  const PlayBlocConsumer({super.key});

  @override
  State<PlayBlocConsumer> createState() => _PlayBlocConsumerState();
}

class _PlayBlocConsumerState extends State<PlayBlocConsumer> {
  
  Box<int> boxResultNow = Hive.box(Constans.boxResultsNumber);
  bool isLosed = false;
  bool isWin = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OneQuestionCubit, OneQuestionState>(
      listener: (context, state) {
        if (state is OneQuestionFailure) {
          customShowDialogError(context, state.errorMassage);
        } else if (state is OneQuestionWin) {
          isWin = true;
          BlocProvider.of<QuestionsCubit>(context).yourLevel++;
          int yourLevel = BlocProvider.of<QuestionsCubit>(context).yourLevel;
          if (yourLevel == 9) {
            boxResultNow.put(1, 0);
          } else {
            incrementValue(
                boxResultNow, 10, 1); //زيادة القيمة في الربح اثناء المرحلة
          }
        } else if (state is OneQuestionLose) {
        //  playSound('sound/lose.mp3');
          incrementValue(
              boxResultNow, -10, 1); //نقصان القيمة في الخسارة اثناء المرحلة
          isLosed = true;
        } else if (state is OneQuestionSuccess) {
          isLosed = false;
          isWin = false;
        }
      },
      builder: (context, state) {
        if (state is OneQuestionSuccess ||
            state is OneQuestionWin ||
            state is OneQuestionLose) {
          return PlayPageBody(isLosed: isLosed, isWin: isWin);
        } else {
          return const CustomLoadingAnimationWidget();
        }
      },
    );
  }

  void incrementValue(Box<int> box, int increase, int who) {
    int currentValue = box.get(who, defaultValue: 0) ?? 1;

    int newValue = currentValue + increase;
    box.put(who, newValue);
  }

  
}
