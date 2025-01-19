import 'package:flutter/widgets.dart';

import '../../../../core/utils/app_text_style.dart';

class CustomContainerAnswer extends StatelessWidget {
  const CustomContainerAnswer({
    super.key,
    required this.theAnswer,
  });

  final String theAnswer;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 7,
      child: Center(
        child: Text(
          theAnswer,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.textStyle20Blach.copyWith(fontSize: 17),
        ),
      ),
    );
  }
}
