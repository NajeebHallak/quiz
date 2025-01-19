import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/utils/constans.dart';
import 'custom_result_container.dart';

class ResultsPageBody extends StatefulWidget {
  const ResultsPageBody({super.key});

  @override
  State<ResultsPageBody> createState() => _ResultsPageBodyState();
}

class _ResultsPageBodyState extends State<ResultsPageBody> {
  Box<String> boxDate = Hive.box(Constans.boxResultsDate);

  @override
  Widget build(BuildContext context) {
    List<String> listDate = boxDate.values.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 45),
      child: ListView.builder(
        itemCount: listDate.length,
        itemBuilder: (context, index) {
          return CustomResultContainer(
            theResult: listDate.elementAt(index),
          );
        },
      ),
    );
  }
}
