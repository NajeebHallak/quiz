import 'package:flutter/material.dart';
import 'package:quiz/core/utils/constans.dart';
import '../utils/app_text_style.dart';

Future<dynamic> customShowDialogToFinalWin(
  BuildContext context,
  String massage,
  void Function() onPressedNext,
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
