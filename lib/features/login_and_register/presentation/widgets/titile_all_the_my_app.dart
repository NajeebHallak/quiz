import 'package:flutter/widgets.dart';
import 'package:quiz/core/utils/app_text_style.dart';

class TitleAllTheMyApp extends StatelessWidget {
  const TitleAllTheMyApp({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: AppTextStyle.textStyle40Pacifico,
    );
  }
}
