import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz/core/utils/app_text_style.dart';

class CustomAppBar extends AppBar {
  final void Function()? onPressed;
  final String ttitle;
  CustomAppBar({
    this.onPressed,
    required this.ttitle,
    super.key,
  }) : super(
            actions: [
              IconButton(
                onPressed: () {
                  exit(0);
                },
                icon: Text(
                  'Exit',
                  style: AppTextStyle.textStyle19,
                ),
              )
            ],
            leading: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            automaticallyImplyLeading: false,
            title: Text(ttitle, style: AppTextStyle.textStyle19));
}
