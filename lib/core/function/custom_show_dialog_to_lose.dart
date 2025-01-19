import 'package:flutter/material.dart';
import 'package:quiz/core/utils/constans.dart';
import '../utils/app_text_style.dart';

Future<dynamic> customShowDialogTolose(
    BuildContext context, String massage, void Function() onPressed) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Constans.kPrimaryColor,
      shadowColor: Colors.white,
      title: Text(
        'OPS!!',
        style: AppTextStyle.textStyle25,
      ),
      content: Text(
        massage,
        style: AppTextStyle.textStyle19.copyWith(color: Colors.grey),
      ),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.replay_rounded),
        ),
      ],
    ),
  );
}
