import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/core/utils/api_services.dart';
import 'package:quiz/features/login_and_register/domain/use_cases/creat_user_use_case.dart';

import '../../features/home/data/data_sources/quiz_local_data_source.dart';
import '../../features/home/data/data_sources/quiz_remot_data_source.dart';
import '../../features/home/data/repositories_impl/home_repo_impl.dart';
import '../../features/home/domain/use_cases/one_question_use_case.dart';
import '../../features/home/domain/use_cases/questions_use_case.dart';
import '../../features/login_and_register/data/data_sources/creat_user_remot_data_source.dart';
import '../../features/login_and_register/data/repositories_impl/creat_and_login_user_repo_impl.dart';
import '../../features/login_and_register/domain/use_cases/login_user_use_case.dart';

final getIt = GetIt.instance;

void serverLacator() {
  getIt.registerSingleton<Api>(Api(Dio()));

  getIt.registerSingleton<CreatOrLoginUserRemotDataSourceImpl>(
      CreatOrLoginUserRemotDataSourceImpl(getIt.get<Api>()));

  getIt.registerSingleton<CreatAndLoginUserRepoImpl>(CreatAndLoginUserRepoImpl(
      getIt.get<CreatOrLoginUserRemotDataSourceImpl>()));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      QuizLocalDataSourceImpl(), QuizRemotDataSourceImpl(getIt.get<Api>())));
  getIt.registerSingleton<LoginUserUseCase>(
      LoginUserUseCase(getIt.get<CreatAndLoginUserRepoImpl>()));

  getIt.registerSingleton<CreatUserUseCase>(
      CreatUserUseCase(getIt.get<CreatAndLoginUserRepoImpl>()));

  getIt.registerSingleton<QuestionUseCase>(
      QuestionUseCase(getIt.get<HomeRepoImpl>()));

  getIt.registerSingleton<OneQuestionUseCase>(
      OneQuestionUseCase((getIt.get<HomeRepoImpl>())));
}
