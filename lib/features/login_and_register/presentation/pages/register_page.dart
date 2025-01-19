import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/core/utils/server_locator_get_it.dart';
import 'package:quiz/features/login_and_register/domain/use_cases/creat_user_use_case.dart';
import 'package:quiz/features/login_and_register/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:quiz/features/login_and_register/presentation/widgets/regestir_bloc_consumer.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(getIt.get<CreatUserUseCase>()),
        child: const RegisterBlocConsumer(),
      ),
    );
  }
}
