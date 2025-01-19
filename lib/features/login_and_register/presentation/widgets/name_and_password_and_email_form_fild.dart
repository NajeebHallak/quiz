import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/features/login_and_register/presentation/cubit/register_cubit/register_cubit.dart';

import 'custom_text_from_fild.dart';

class NameAndPasswordAndEmailFormFild extends StatefulWidget {
  const NameAndPasswordAndEmailFormFild({
    super.key,
  });

  @override
  State<NameAndPasswordAndEmailFormFild> createState() =>
      _NameAndPasswordAndEmailFormFildState();
}

class _NameAndPasswordAndEmailFormFildState
    extends State<NameAndPasswordAndEmailFormFild> {
  String confirmpassword = '';
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFromFild(
          hintText: 'Full_Name',
          prefixIcon: Icons.person,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'The field must be filled out';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: 25),
        CustomTextFromFild(
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email,
          hintText: 'E.Mail',
          onChanged: (value) {
            BlocProvider.of<RegisterCubit>(context).email = value;
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
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'The field must be filled out';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            confirmpassword = value;
            BlocProvider.of<RegisterCubit>(context).password = value;
          },
        ),
        const SizedBox(height: 25),
        CustomTextFromFild(
          obscureText: obscureText,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: Icons.lock,
          hintText: 'Confirm_password',
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
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'The field must be filled out';
            } else if (value != confirmpassword) {
              return 'Confirm password';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
