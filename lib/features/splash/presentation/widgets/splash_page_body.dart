import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/features/splash/presentation/widgets/custom_animated_builder.dart';

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * .08),
          child: const CustomAnimatedBuilder(),
        )
      ],
    );
  }
}
