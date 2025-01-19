import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({
    super.key,
    required this.leftTimer,
  });

  final int leftTimer;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 5, color: Colors.white)),
        child: Center(
          child: Text(leftTimer.toString(),
              style: AppTextStyle.textStyle25.copyWith(fontFamily: 'Pacifico')),
        ));
  }
}
