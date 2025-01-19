import 'package:dartz/dartz.dart';
import 'package:quiz/features/login_and_register/domain/entities/crest_or_login_user_entities.dart';

import '../../../../core/errors/failure.dart';

abstract class CreatOrLoginUserRepo {
  Future<Either<Failure, CreatOrLoginUserEntites>> fetchTokenRegister(
      {String email, String password});
  Future<Either<Failure, CreatOrLoginUserEntites>> fetchTokenLogin(
      {String email, String password});
}
