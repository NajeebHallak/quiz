import 'package:flutter/material.dart';
import 'package:quiz/core/utils/constans.dart';
import '../utils/app_text_style.dart';

Future<dynamic> customShowDialogToWin(
  BuildContext context,
  String massage,
  void Function() onPressedNext,
  void Function() onPressedReplay,
) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      backgroundColor: Constans.kPrimaryColor,
      shadowColor: Colors.white,
      title: Text(
        'Bravo!!',
        style: AppTextStyle.textStyle25,
      ),
      content: Text(
        massage,
        style: AppTextStyle.textStyle19.copyWith(color: Colors.grey),
      ),
      actions: [
        IconButton(
          onPressed: onPressedReplay,
          icon: const Icon(Icons.replay_rounded),
        ),
        IconButton(
          onPressed: onPressedNext,
          icon: Text(
            'Next',
            style: AppTextStyle.textStyle15,
          ),
        ),
      ],
    ),
  );
}
