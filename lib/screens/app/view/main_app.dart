import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:freckled_zelda/screens/app/view/sides/left_side.dart';
import 'package:freckled_zelda/screens/app/view/sides/right_side.dart';
import 'package:freckled_zelda/shared/custom_text.dart';
import 'package:freckled_zelda/utils/colors.dart';
import 'package:freckled_zelda/utils/sizes.dart';
import 'package:get/get.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: constraints.maxHeight * 0.01),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Icon(
                          Octicons.apps,
                          color: kWhiteColor,
                          size: 25,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Align(
                          child: CText(
                            text: "AI-Duo",
                            size: 50,
                            fontFamily: CFONT.BOLD,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: heightSize(30)),
                Expanded(
                    child: Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.3,
                      child: const LeftSide(),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.7,
                      child: const RightSide(),
                    ),
                  ],
                ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
