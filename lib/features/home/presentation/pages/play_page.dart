import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/home/presentation/cubit/questions_cubit/questions_cubit.dart';
import 'package:quiz/features/home/presentation/widgets/custom_app_bar.dart';
import '../cubit/one_question_cubit/one_question_cubit.dart';
import '../widgets/paly_bloc_consumer.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        ttitle: 'Quiz Page ',
        onPressed: () {
          onPressedBackToGameLevelPage(context);
        },
      ),
      body: const PlayBlocConsumer(),
    );
  }

  void onPressedBackToGameLevelPage(BuildContext context) {
    BlocProvider.of<OneQuestionCubit>(context).timer.cancel();
    BlocProvider.of<QuestionsCubit>(context)
        .fetchQuestions(selectCategory: 0, selectDifficulty: '', type: '');
    GoRouter.of(context).pop();
  }
}
