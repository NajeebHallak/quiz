import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/features/login_and_register/presentation/cubit/login_cubit/login_cubit.dart';

import 'custom_text_from_fild.dart';

class PasswordAndEmailFormFild extends StatefulWidget {
  const PasswordAndEmailFormFild({
    super.key,
  });

  @override
  State<PasswordAndEmailFormFild> createState() =>
      _PasswordAndEmailFormFildState();
}

class _PasswordAndEmailFormFildState extends State<PasswordAndEmailFormFild> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFromFild(
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email,
          hintText: 'E.Mail',
          onChanged: (value) {
            BlocProvider.of<LoginCubit>(context).email = value;
          },
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'The field must be filled out';
            } else if (!(value!.contains('@'))) {
              return 'The text must contain @';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: 25),
        CustomTextFromFild(
          obscureText: obscureText,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: Icons.lock,
          hintText: 'Password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: obscureText
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.visibility_off),
          ),
          onChanged: (value) {
            BlocProvider.of<LoginCubit>(context).password = value;
          },
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'The field must be filled out';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
