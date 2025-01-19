import 'package:dartz/dartz.dart';
import 'package:quiz/core/errors/failure.dart';
import 'package:quiz/core/use_case.dart/use_case.dart';
import 'package:quiz/features/login_and_register/domain/entities/crest_or_login_user_entities.dart';
import 'package:quiz/features/login_and_register/domain/repositories/creat_or_login_user_repo.dart';

class CreatUserUseCase extends UseCase<
    Future<Either<Failure, CreatOrLoginUserEntites>>, String, String, NoData> {
  CreatUserUseCase(this.creatOrLoginUserRepo);
  CreatOrLoginUserRepo creatOrLoginUserRepo;
  @override
  Future<Either<Failure, CreatOrLoginUserEntites>> call(
      [String param1 = '', String param2 = '', NoData? param3]) {
    return creatOrLoginUserRepo.fetchTokenRegister(
        email: param1, password: param2);
  }
}
