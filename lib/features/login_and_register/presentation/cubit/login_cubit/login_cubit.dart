import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:quiz/features/login_and_register/domain/use_cases/login_user_use_case.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/crest_or_login_user_entities.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUserUseCase) : super(LoginInitial());
  LoginUserUseCase loginUserUseCase;
  String? email;
  String? password;

  fetchTokenLogin({required String email, required String password}) async {
    emit(LoginLoade());
    Either<Failure, CreatOrLoginUserEntites> result =
        await loginUserUseCase.call(email, password);
    result.fold((failure) {
      emit(LoginFailure(failure.errorMassage));
    }, (right) {
      print(right.token1);
      emit(LoginSuccess());
    });
  }
}
