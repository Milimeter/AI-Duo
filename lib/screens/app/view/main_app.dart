import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/models/sessions.dart';
import 'package:ai_duo/routes/app_pages.dart';
import 'package:ai_duo/screens/app/controller/app_controller.dart';
import 'package:ai_duo/screens/app/view/panel/side_drawer.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:get/get.dart';

import 'pages/empty_session.dart';
import 'pages/img_to_img.dart';
import 'pages/text_to_img.dart';
import 'panel/session_drawer.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  AppController appController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isSliderOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kBackgroundColor,
      // drawer: const SessionDrawer(),
      drawer: const SideDrawer(),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: constraints.maxHeight * 0.01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_scaffoldKey.currentState!.isDrawerOpen) {
                            _scaffoldKey.currentState!.closeDrawer();
                            //close drawer, if drawer is open
                          } else {
                            _scaffoldKey.currentState!.openDrawer();
                            //open drawer, if drawer is closed
                          }
                          setState(() {});
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            // isSliderOpen ? Octicons.x : Octicons.apps,
                            Octicons.apps,
                            color: kTextTitleColor,
                            size: 25,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Align(
                            child: CText(
                              text: "AI DUO",
                              fontFamily: CFONT.BOLD,
                              size: 21,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: heightSize(10)),
                //no session
                if (appController.currentSession.value.id == null)
                  const Expanded(child: EmptySession()),

                //Image to Image Session
                if (appController.currentSession.value.id != null &&
                    appController.currentSession.value.sessionType ==
                        SessionType.IMAGE_TO_IMAGE)
                  const Expanded(child: ImgToImgSession()),

                //Text to Image Session
                if (appController.currentSession.value.id != null &&
                    appController.currentSession.value.sessionType ==
                        SessionType.TEXT_TO_IMAGE)
                  const Expanded(child: TextToImgSession()),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: Obx(
        () => appController.currentSession.value.id != null &&
                appController.currentSession.value.sessionType ==
                    SessionType.TEXT_TO_IMAGE
            ? IntrinsicWidth(
                child: GestureDetector(
                  onTap: () async {
                    if (appController.isTextToImageBtnReady.value) {
                      appController.isTextToImageArtLoading.value = true;
                      // Simulate uploading image
                      await Future.delayed(const Duration(seconds: 2));
                      appController.isTextToImageArtLoading.value = false;
                      Get.toNamed(Routes.TXT_TO_IMG_OUTPUT);
                    }
                  },
                  child: Container(
                    height: heightSize(40),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    margin: const EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(
                      color: appController.isTextToImageBtnReady.value
                          ? kPrimaryColor
                          : kGreyColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(Values().boxRadius),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: CText(
                              text:
                                  appController.isTextToImageArtLoading.value ==
                                          true
                                      ? "Generating Art"
                                      : "Generate Art",
                              fontFamily: CFONT.REGULAR,
                              color: appController.isTextToImageBtnReady.value
                                  ? kWhiteColor.withOpacity(0.8)
                                  : kTextTitleColor.withOpacity(0.3),
                              size: 14,
                            ),
                          ),
                          SizedBox(
                            width: widthSize(10),
                          ),
                          appController.isTextToImageArtLoading.value == true
                              ? Transform.scale(
                                  scale: 0.5,
                                  child: const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        kWhiteColor),
                                  ),
                                )
                              : Icon(
                                  Octicons.paintbrush,
                                  size: 18,
                                  color:
                                      appController.isTextToImageBtnReady.value
                                          ? kWhiteColor.withOpacity(0.8)
                                          : kTextTitleColor.withOpacity(0.3),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
