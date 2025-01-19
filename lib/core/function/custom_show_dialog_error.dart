import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_text_style.dart';

Future<dynamic> customShowDialogError(
    BuildContext context, String errorMassage) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'Error',
        style: AppTextStyle.textStyle25,
      ),
      content: Text(
        errorMassage,
        style: AppTextStyle.textStyle19.copyWith(color: Colors.red),
      ),
      actions: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Text(
              'Ok',
              style: AppTextStyle.textStyle15,
            ))
      ],
    ),
  );
}
