// ignore_for_file: constant_identifier_names

import 'package:freckled_zelda/screens/app/binding/app_binding.dart';
import 'package:freckled_zelda/screens/app/view/main_app.dart';
import 'package:freckled_zelda/screens/auth/binding/auth_binding.dart';
import 'package:freckled_zelda/screens/auth/view/auth_intro.dart';
import 'package:freckled_zelda/screens/auth/view/pages/login.dart';
import 'package:freckled_zelda/screens/auth/view/pages/signup.dart';
import 'package:freckled_zelda/screens/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const SPLASHSCREEN = Routes.INITIAL;
  static final routes = [
    GetPage(
      name: SPLASHSCREEN,
      page: () => const SplashScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.AUTH_INTRO,
      page: () => const AuthIntro(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_SCREEN,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.SIGNUP_SCREEN,
      page: () => const SignupScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.MAIN_APP,
      page: () => const MainApp(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: AppBinding(),
    ),
  ];
}
