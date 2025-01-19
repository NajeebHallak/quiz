import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/home/presentation/cubit/one_question_cubit/one_question_cubit.dart';
import 'package:quiz/features/home/presentation/widgets/custom_confetti.dart';
import 'package:quiz/features/home/presentation/widgets/custom_linear_percent_indicator.dart';
import 'package:quiz/features/home/presentation/widgets/custom_timer.dart';
import 'package:quiz/features/home/presentation/widgets/the_answers_column.dart';
import 'package:quiz/features/home/presentation/widgets/the_qustion_container.dart';

class PlayPageBody extends StatefulWidget {
  const PlayPageBody({super.key, required this.isLosed, required this.isWin});
  final bool isLosed;
  final bool isWin;
  @override
  State<PlayPageBody> createState() => _PlayPageBodyState();
}

class _PlayPageBodyState extends State<PlayPageBody> {
  late ConfettiController confettiController;
  int leftTimer = 20;

  @override
  void initState() {
    super.initState();
    creatTimer();
    confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            const CustomLinearPercentIndicator(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  CustomTimer(leftTimer: leftTimer),
                  const SizedBox(height: 60),
                  const TheQustionContainer(),
                  const SizedBox(height: 19),
                  TheAnswersColumn(
                    isLosed: widget.isLosed,
                    isWin: widget.isWin,
                    confettiController: confettiController,
                  ),
                ],
              ),
            ),
          ],
        ),
        CustomConfetti(confettiController: confettiController),
      ],
    );
  }

  void creatTimer() {
    BlocProvider.of<OneQuestionCubit>(context).timer =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (leftTimer > 0) {
            leftTimer--;
          } else {
            BlocProvider.of<OneQuestionCubit>(context).lose();
            timer.cancel();
            GoRouter.of(context).pop();
          }
        });
      }
    });
  }
}
