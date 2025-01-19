import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/home/presentation/widgets/game_level_bloc_consumer.dart';

import '../widgets/custom_app_bar.dart';

class GameLevelpage extends StatelessWidget {
  const GameLevelpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        ttitle: 'Your Level',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const GameLevelBocConsumer(),
    );
  }
}
