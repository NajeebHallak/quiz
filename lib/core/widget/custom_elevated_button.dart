import 'package:flutter/material.dart';
import 'package:quiz/core/utils/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, this.onPressed, required this.typeTheButton});
  final void Function()? onPressed;
  final String typeTheButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith(
            (states) {
              return states.contains(MaterialState.pressed)
                  ? Colors.blue
                  : null;
            },
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12.0), // تعيين نصف قطر الحواف الدائرية
              side: const BorderSide(color: Colors.blue), // تعيين لون الحدود
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          typeTheButton,
          style: AppTextStyle.textStyle25.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
