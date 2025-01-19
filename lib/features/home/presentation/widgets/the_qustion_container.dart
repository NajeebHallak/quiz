import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/features/home/presentation/cubit/one_question_cubit/one_question_cubit.dart';
import '../../../../core/utils/app_text_style.dart';

class TheQustionContainer extends StatelessWidget {
  const TheQustionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 10 / 5,
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              BlocProvider.of<OneQuestionCubit>(context).quizEntities.question,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyle20Blach,
            ),
          ),
        ),
      ),
    );
  }
}
