import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/core/routers/app_page_name.dart';
import 'package:quiz/core/widget/custom_elevated_button.dart';
import 'package:quiz/features/login_and_register/presentation/widgets/titile_all_the_my_app.dart';

import 'share_and_rate_row.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          const TitleAllTheMyApp(title: 'Let\'s Play Quiz!! '),
          const Spacer(flex: 1),
          CustomElevatedButton(
              typeTheButton: 'Start Play',
              onPressed: () {
                GoRouter.of(context).push(AppPageName.selectionPage);
              }),
          const SizedBox(height: 25),
          CustomElevatedButton(
              typeTheButton: 'Results',
              onPressed: () {
                GoRouter.of(context).push(AppPageName.resultPage);
              }),
          const Spacer(flex: 1),
          const Row(
            children: [
              Spacer(),
              ShareAndRateRow(
                  icon: Icons.share, colorIcon: Colors.blue, text: 'Share'),
              Spacer(),
              ShareAndRateRow(
                  icon: Icons.star, colorIcon: Colors.yellow, text: 'Rate Us'),
              Spacer(),
            ],
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
