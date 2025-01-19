import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../core/utils/app_text_style.dart';
import '../cubit/questions_cubit/questions_cubit.dart';

class RowYouHavePassedThisLeve extends StatelessWidget {
  const RowYouHavePassedThisLeve({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int yourLevel = BlocProvider.of<QuestionsCubit>(context).yourLevel;

    return Row(
      children: [
        Expanded(
          child: Text(
            'you have passed this leve!! ',
            style: AppTextStyle.textStyle40Pacifico.copyWith(fontSize: 30),
          ),
        ),
        CircularPercentIndicator(
          radius: 55.0,
          lineWidth: 10.0,
          percent: (yourLevel * 100) / 900,
          center: Text(
            "${((yourLevel * 100) / 9).round()}%",
            style: AppTextStyle.textStyle40Pacifico.copyWith(fontSize: 30),
          ),
          progressColor: Colors.green,
        ),
      ],
    );
  }
}
