import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/function/custom_show_dialog_error.dart';
import '../../../../core/routers/app_page_name.dart';
import '../cubit/register_cubit/register_cubit.dart';
import 'register_page_body.dart';

class RegisterBlocConsumer extends StatelessWidget {
  const RegisterBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          GoRouter.of(context).push(AppPageName.homePage);
        } else if (state is RegisterFailure) {
          customShowDialogError(context, state.errorMassage);
        }
      },
      builder: (context, state) {
        return RegisterPageBody(isLoade: state is RegisterLoade ? true : false);
      },
    );
  }
}
