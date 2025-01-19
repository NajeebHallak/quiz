import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz/core/routers/routers.dart';
import 'package:quiz/core/utils/constans.dart';
import 'package:quiz/core/utils/simpol_bloc_obcerver.dart';
import 'package:quiz/features/home/domain/entities/quiz_entities.dart';
import 'package:quiz/features/home/domain/use_cases/one_question_use_case.dart';
import 'package:quiz/features/home/domain/use_cases/questions_use_case.dart';
import 'package:quiz/features/home/presentation/cubit/one_question_cubit/one_question_cubit.dart';
import 'package:quiz/features/home/presentation/cubit/questions_cubit/questions_cubit.dart';
import 'package:quiz/features/login_and_register/domain/entities/crest_or_login_user_entities.dart';
import 'core/utils/server_locator_get_it.dart';

void main() async {
  serverLacator();

  await Hive.initFlutter();

  Hive.registerAdapter(CreatOrLoginUserEntitesAdapter());

  await Hive.openBox<CreatOrLoginUserEntites>(Constans.boxCreatAndLoginUser);

  Hive.registerAdapter(QuizEntitiesAdapter());

  await Hive.openBox<QuizEntities>(Constans.boxQuizEntitie);

  await Hive.openBox<int>(Constans.boxResultsNumber);

  await Hive.openBox<String>(Constans.boxResultsDate);

  Bloc.observer = SimpolBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuestionsCubit(getIt.get<QuestionUseCase>()),
        ),
        BlocProvider(
            create: (context) =>
                OneQuestionCubit(getIt.get<OneQuestionUseCase>()))
      ],
      child: MaterialApp.router(
        routerConfig: Routers.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Constans.kPrimaryColor,
          appBarTheme: AppBarTheme(
              backgroundColor: Constans.kPrimaryColor, elevation: 0.2),
        ),
      ),
    );
  }
}
