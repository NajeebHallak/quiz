import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/core/function/custom_show_dialog_error.dart';
import 'package:quiz/features/login_and_register/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:quiz/features/login_and_register/presentation/widgets/login_page_body.dart';
import '../../../../core/routers/app_page_name.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).push(AppPageName.homePage);
        } else if (state is LoginFailure) {
          customShowDialogError(context, state.errorMassge);
        }
      },
      builder: (context, state) {
        return LoginPageBody(
          isLoade: state is LoginLoade ? true : false,
        );
      },
    );
  }
}
