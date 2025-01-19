import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/features/home/presentation/cubit/questions_cubit/questions_cubit.dart';
import 'package:quiz/features/home/presentation/widgets/container_done_level.dart';
import 'package:quiz/features/home/presentation/widgets/container_go_play.dart';
import 'package:quiz/features/home/presentation/widgets/container_lock_level.dart';
import '../../domain/entities/quiz_entities.dart';

class GridViewBuilderGameLevel extends StatefulWidget {
  const GridViewBuilderGameLevel({
    super.key,
  });

  @override
  State<GridViewBuilderGameLevel> createState() =>
      _GridViewBuilderGameLevelState();
}

class _GridViewBuilderGameLevelState extends State<GridViewBuilderGameLevel> {
  @override
  Widget build(BuildContext context) {
    List<QuizEntities> quizEntities =
        BlocProvider.of<QuestionsCubit>(context).quizEntities;

    int yourLevel = BlocProvider.of<QuestionsCubit>(context).yourLevel;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: SizedBox(
        height: 450,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //عدد القطع في السطر الواحد
            crossAxisSpacing: 25, //المسافة في السطر
            mainAxisSpacing: 40, //المسافة في العامود
            childAspectRatio: 1, //نسبة العرض الى الطول
          ),
          itemCount: quizEntities.length,
          itemBuilder: (context, index) => yourLevel < index
              ? const ContainerlockLevel()
              : yourLevel == index
                  ? ContainerGoPlay(index: yourLevel)
                  : const ContainerDoneLevel(),
        ),
      ),
    );
  }
}
