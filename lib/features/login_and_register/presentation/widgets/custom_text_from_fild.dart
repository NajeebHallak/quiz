import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomTextFromFild extends StatelessWidget {
  const CustomTextFromFild({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.prefixIcon,
    this.validator,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
  });
  final String hintText;
  final Widget? suffixIcon;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
        border: methodOutLineInpotBorder(),
        focusedBorder: methodOutLineInpotBorder(),
        enabledBorder: methodOutLineInpotBorder(),
        prefixIcon: Icon(prefixIcon),
        labelText: hintText,
        labelStyle: AppTextStyle.textStyle15,
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder methodOutLineInpotBorder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(15)));
  }
}
