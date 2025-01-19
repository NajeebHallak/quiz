import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/home/presentation/widgets/custom_app_bar.dart';
import '../widgets/selection_page_body.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        ttitle: 'Selection page',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const SelectionPageBody(),
    );
  }
}
