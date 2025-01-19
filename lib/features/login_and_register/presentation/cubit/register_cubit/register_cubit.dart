import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:quiz/features/login_and_register/domain/use_cases/creat_user_use_case.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/crest_or_login_user_entities.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.creatUserUseCase) : super(RegisterInitial());

  CreatUserUseCase creatUserUseCase;
  String? email;
  String? password;

  fetchTokenRegister({required String email, required String password}) async {
    emit(RegisterLoade());
    Either<Failure, CreatOrLoginUserEntites> result =
        await creatUserUseCase.call(email, password);
    result.fold((failure) {
      emit(RegisterFailure(failure.errorMassage));
    }, (right) {
      emit(RegisterSuccess());
    });
  }
}
