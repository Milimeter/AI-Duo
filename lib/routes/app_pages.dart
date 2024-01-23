// ignore_for_file: constant_identifier_names

import 'package:ai_duo/screens/app/binding/app_binding.dart';
import 'package:ai_duo/screens/app/view/main_app.dart';
import 'package:ai_duo/screens/app/view/pages/filters_page.dart';
import 'package:ai_duo/screens/app/view/pages/subscription_display.dart';
import 'package:ai_duo/screens/app/view/pages/txt_to_img_output.dart';
import 'package:ai_duo/screens/auth/binding/auth_binding.dart';
import 'package:ai_duo/screens/auth/view/auth_intro.dart';
import 'package:ai_duo/screens/auth/view/pages/add_wallet.dart';
import 'package:ai_duo/screens/auth/view/pages/create_wallet.dart';
import 'package:ai_duo/screens/auth/view/pages/import_wallet.dart';
import 'package:ai_duo/screens/splash_screen.dart';
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
      name: Routes.ADD_WALLET,
      page: () => const AddWallet(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.CREATE_WALLET,
      page: () => const CreateWallet(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.IMPORT_WALLET,
      page: () => const ImportWallet(),
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
    GetPage(
      name: Routes.FILTERS_PAGE,
      page: () => const FiltersPage(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.TXT_TO_IMG_OUTPUT,
      page: () => const TxtToImgOutput(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.SUBSCRIPTION_DISPLAY,
      page: () => const SubscriptionDisplay(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 800),
      binding: AppBinding(),
    ),
  ];
}
