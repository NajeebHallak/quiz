import 'package:go_router/go_router.dart';
import 'package:quiz/core/routers/app_page_name.dart';
import 'package:quiz/features/home/presentation/pages/results_page.dart';
import 'package:quiz/features/home/presentation/pages/selection_page.dart';
import 'package:quiz/features/home/presentation/pages/game_level_page.dart';
import 'package:quiz/features/home/presentation/pages/home_page.dart';
import 'package:quiz/features/home/presentation/pages/play_page.dart';
import 'package:quiz/features/login_and_register/presentation/pages/login_page.dart';
import 'package:quiz/features/login_and_register/presentation/pages/register_page.dart';
import 'package:quiz/features/splash/presentation/pages/splash_page.dart';

abstract class Routers {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppPageName.splashPage,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppPageName.loginPage,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppPageName.registerPage,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppPageName.homePage,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppPageName.gameLevelPage,
        builder: (context, state) => const GameLevelpage(),
      ),
      GoRoute(
        path: AppPageName.playPage,
        builder: (context, state) => const PlayPage(),
      ),
      GoRoute(
        path: AppPageName.selectionPage,
        builder: (context, state) => const SelectionPage(),
      ),
      GoRoute(
        path: AppPageName.resultPage,
        builder: (context, state) => const ResultsPage(),
      ),
    ],
  );
}
