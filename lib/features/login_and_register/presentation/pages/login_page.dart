import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/core/utils/server_locator_get_it.dart';
import 'package:quiz/features/login_and_register/presentation/cubit/login_cubit/login_cubit.dart';

import '../../domain/use_cases/login_user_use_case.dart';
import '../widgets/login_bloc_consumer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BlocProvider(
        create: (context) => LoginCubit(getIt.get<LoginUserUseCase>()),
        child: const Scaffold(
          body: LoginBlocConsumer(),
        ),
      ),
    );
  }
}
