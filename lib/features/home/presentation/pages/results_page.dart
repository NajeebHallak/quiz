import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/home/presentation/widgets/custom_app_bar.dart';
import '../widgets/result_page_body.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        ttitle: 'Result Page',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const ResultsPageBody(),
    );
  }
}
