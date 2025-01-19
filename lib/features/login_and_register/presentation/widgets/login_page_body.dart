import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quiz/core/routers/app_page_name.dart';
import 'package:quiz/core/widget/custom_elevated_button.dart';
import 'package:quiz/features/login_and_register/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:quiz/features/login_and_register/presentation/widgets/password_and_email_form_fild.dart';
import 'package:quiz/features/login_and_register/presentation/widgets/titile_all_the_my_app.dart';
import 'page_to_move_to_another_registration.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({
    super.key,
    required this.isLoade,
  });
  final bool isLoade;
  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
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
                const PasswordAndEmailFormFild(),
                const SizedBox(height: 65),
                CustomElevatedButton(
                  typeTheButton: 'Login',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).fetchTokenLogin(
                        email: BlocProvider.of<LoginCubit>(context).email!,
                        password:
                            BlocProvider.of<LoginCubit>(context).password!,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                ),
                const SizedBox(height: 8),
                PageToMoveToAnotherRegistration(
                  text1: 'don\'t hav an account?',
                  text2: 'Register',
                  onTap: () {
                    GoRouter.of(context).push(AppPageName.registerPage);
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
