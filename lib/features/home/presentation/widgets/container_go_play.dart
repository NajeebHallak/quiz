import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/core/routers/app_page_name.dart';
import 'package:quiz/features/home/presentation/cubit/one_question_cubit/one_question_cubit.dart';

import '../../../../core/utils/app_text_style.dart';

class ContainerGoPlay extends StatelessWidget {
  const ContainerGoPlay({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          GoRouter.of(context).push(AppPageName.playPage);
          BlocProvider.of<OneQuestionCubit>(context)
              .fetchOneQuestion(index: index);
        },
        child: Center(
          child: Text(
            'go',
            style:
                AppTextStyle.textStyle40Pacifico.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
