import 'package:flutter/material.dart';
import 'package:quiz/core/utils/app_text_style.dart';

class CircleKeyAnimation extends StatelessWidget {
  const CircleKeyAnimation({
    super.key,
    required this.keyAni,
    required this.size,
    required this.color,
  });
  final String keyAni;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: color,
      child: Text(
        keyAni,
        style: AppTextStyle.textStyle55,
      ),
    );
  }
}
