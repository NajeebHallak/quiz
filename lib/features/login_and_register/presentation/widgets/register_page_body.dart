import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quiz/features/login_and_register/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:quiz/features/login_and_register/presentation/widgets/titile_all_the_my_app.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import 'name_and_password_and_email_form_fild.dart';
import 'page_to_move_to_another_registration.dart';

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({
    super.key,
    required this.isLoade,
  });
  final bool isLoade;
  @override
  State<RegisterPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<RegisterPageBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: widget.isLoade,
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.0),
            child: Column(
              children: [
                const SizedBox(height: 90),
                const TitleAllTheMyApp(title: 'Quiz\nChoose Currect!!'),
                const SizedBox(height: 105),
                const NameAndPasswordAndEmailFormFild(),
                const SizedBox(height: 65),
                CustomElevatedButton(
                  typeTheButton: 'Register',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<RegisterCubit>(context)
                          .fetchTokenRegister(
                              email: BlocProvider.of<RegisterCubit>(context)
                                  .email!,
                              password: BlocProvider.of<RegisterCubit>(context)
                                  .password!);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                ),
                const SizedBox(height: 8),
                PageToMoveToAnotherRegistration(
                  text1: 'already hav an account?',
                  text2: ' Login',
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
