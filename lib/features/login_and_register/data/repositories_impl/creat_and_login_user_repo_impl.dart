import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quiz/core/errors/failure.dart';
import 'package:quiz/features/login_and_register/data/data_sources/creat_user_remot_data_source.dart';
import 'package:quiz/features/login_and_register/domain/entities/crest_or_login_user_entities.dart';
import 'package:quiz/features/login_and_register/domain/repositories/creat_or_login_user_repo.dart';

class CreatAndLoginUserRepoImpl extends CreatOrLoginUserRepo {
  CreatAndLoginUserRepoImpl(this.creatOrLoginUserRemotDataSource);
  CreatOrLoginUserRemotDataSource creatOrLoginUserRemotDataSource;

  @override
  Future<Either<Failure, CreatOrLoginUserEntites>> fetchTokenRegister(
      {String email = '', String password = ''}) async {
    // Box<CreatOrLoginUserEntites> box = Hive.box(Constans.boxCreatAndLoginUser);
    try {
      CreatOrLoginUserEntites creatOrLoginUserEntites;
      creatOrLoginUserEntites = await creatOrLoginUserRemotDataSource
          .fetchTocenRegister(email: email, password: password);
      return Right(creatOrLoginUserEntites);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreatOrLoginUserEntites>> fetchTokenLogin(
      {String email = '', String password = ''}) async {
    try {
      CreatOrLoginUserEntites creatOrLoginUserEntites;
      creatOrLoginUserEntites = await creatOrLoginUserRemotDataSource
          .fetchTocenLogin(email: email, password: password);
      return Right(creatOrLoginUserEntites);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
