import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../cubit/questions_cubit/questions_cubit.dart';

class CustomLinearPercentIndicator extends StatelessWidget {
  const CustomLinearPercentIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int yourLevel = BlocProvider.of<QuestionsCubit>(context).yourLevel;
    return LinearPercentIndicator(
      width: MediaQuery.of(context).size.width,
      lineHeight: 5.0,
      percent: (yourLevel * 100) / 900,
      backgroundColor: Colors.grey,
      progressColor: Colors.green,
    );
  }
}
