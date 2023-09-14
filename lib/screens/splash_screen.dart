import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freckled_zelda/constants/font_family.dart';
import 'package:freckled_zelda/constants/steps.dart';
import 'package:freckled_zelda/routes/app_pages.dart';
import 'package:freckled_zelda/services/storage.dart';
import 'package:freckled_zelda/utils/colors.dart';
import 'package:get/get.dart';

import '../shared/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() async {
    String step = await Storage.getStep() ?? '';
    log("Step is $step");
    switch (step) {
      case Steps.AUTH_INTRO:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.AUTH_INTRO);
        });
        break;
      case Steps.AUTH:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(
            Routes.LOGIN_SCREEN,
          );
        });
        break;
      case Steps.DONE:
        Timer(const Duration(seconds: 4), () async {
          Get.toNamed(Routes.MAIN_APP);
        });
        break;

      default:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.AUTH_INTRO);
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Align(
                  child: CText(
                    text: "FRECKLED ZELDA",
                    size: 50,
                    fontFamily: CFontFamily.DongleBold,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
