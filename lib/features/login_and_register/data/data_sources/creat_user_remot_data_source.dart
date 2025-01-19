import 'package:hive/hive.dart';
import 'package:quiz/core/utils/api_services.dart';
import 'package:quiz/core/utils/constans.dart';
import 'package:quiz/features/login_and_register/data/models/creat_or_login_model.dart';
import 'package:quiz/features/login_and_register/domain/entities/crest_or_login_user_entities.dart';

abstract class CreatOrLoginUserRemotDataSource {
  Future<CreatOrLoginUserEntites> fetchTocenRegister(
      {String email, String password});
  Future<CreatOrLoginUserEntites> fetchTocenLogin(
      {String email, String password});
}

class CreatOrLoginUserRemotDataSourceImpl
    extends CreatOrLoginUserRemotDataSource {
  CreatOrLoginUserRemotDataSourceImpl(this.api);
  Api api;

  @override
  Future<CreatOrLoginUserEntites> fetchTocenRegister(
      {String email = '', String password = ''}) async {
    Map<String, dynamic> theData =
        await api.post(endPodint: 'register', email: email, password: password);
    CreatOrLoginUserEntites creatOrLoginUserEntites =
        CreatOrLoginModel.fromJson(theData);
    Box<CreatOrLoginUserEntites> box =
        Hive.box<CreatOrLoginUserEntites>(Constans.boxCreatAndLoginUser);
    box.add(creatOrLoginUserEntites);
    return creatOrLoginUserEntites;
  }

  @override
  Future<CreatOrLoginUserEntites> fetchTocenLogin(
      {String email = '', String password = ''}) async {
    Map<String, dynamic> theData =
        await api.post(endPodint: 'login', email: email, password: password);

    CreatOrLoginUserEntites creatOrLoginUserEntites =
        CreatOrLoginModel.fromJson(theData);
    Box<CreatOrLoginUserEntites> box =
        Hive.box<CreatOrLoginUserEntites>(Constans.boxCreatAndLoginUser);
    box.add(creatOrLoginUserEntites);
    return creatOrLoginUserEntites;
  }
}
