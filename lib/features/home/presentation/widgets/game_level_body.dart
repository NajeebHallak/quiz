import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/features/home/presentation/widgets/grid_view_builder_game_level.dart';
import 'package:quiz/features/home/presentation/widgets/row_you_have_passed_this_level.dart';

class GameLevelBody extends StatelessWidget {
  const GameLevelBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.0),
      child: Column(
        children: [
          Spacer(),
          RowYouHavePassedThisLeve(),
          Spacer(),
          GridViewBuilderGameLevel(),
        ],
      ),
    );
  }
}
