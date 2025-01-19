import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:quiz/core/utils/constans.dart';
import 'package:quiz/features/home/presentation/widgets/game_level_body.dart';
import '../../../../core/function/custom_show_dialog_error.dart';
import '../../../../core/function/custom_show_dialog_to_final_win.dart';
import '../../../../core/widget/custom_loading_animation_widget.dart';
import '../cubit/questions_cubit/questions_cubit.dart';

class GameLevelBocConsumer extends StatelessWidget {
  const GameLevelBocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Box<int> result = Hive.box(Constans.boxResultsNumber);

    return BlocConsumer<QuestionsCubit, QuestionsState>(
      listener: (context, state) {
        if (state is QuestionsFailure) {
          customShowDialogError(context, state.errorMassage);
        } else if (state is QuestionsSuccess) {
          int yourLevel = BlocProvider.of<QuestionsCubit>(context).yourLevel;
          if (yourLevel == 9) {
            int theResult = (result.get(0)! * 100 / 90).round();
            customShowDialogToFinalWin(
              context,
              'You Win Bravoo ! Your Result is $theResult%',
              () {
                GoRouter.of(context).pop();
                GoRouter.of(context).pop();
              },
            );
          }
        }
      },
      builder: (context, state) {
        if (state is QuestionsSuccess) {
          return GameLevelBody();
        } else if (state is QuestionsFailure) {
          return const Center();
        } else {
          return const SizedBox(
              height: 450, child: CustomLoadingAnimationWidget());
        }
      },
    );
  }
}
