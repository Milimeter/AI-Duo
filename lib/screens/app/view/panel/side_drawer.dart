import 'package:ai_duo/constants/assets_path.dart';
import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/models/sessions.dart';
import 'package:ai_duo/routes/app_pages.dart';
import 'package:ai_duo/screens/app/controller/app_controller.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:ai_duo/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:random_avatar/random_avatar.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  AppController appController = Get.find();

  final sessionItem1 = Session(
    id: "",
    sessionType: SessionType.IMAGE_TO_IMAGE,
    sessionImage: img2img,
    sessionTime: DateTime.now(),
    sessionData: {},
  );
  final sessionItem2 = Session(
    id: "",
    sessionType: SessionType.TEXT_TO_IMAGE,
    sessionImage: img2img,
    sessionTime: DateTime.now(),
    sessionData: {},
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Get.width * 0.5,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(Values().boxRadius),
            left: Radius.circular(Values().boxRadius),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: heightSize(20)),
            // CText(
            //   text: "AI Duo",
            //   fontFamily: CFONT.SEMIBOLD,
            //   color: kPrimaryColor.withOpacity(0.5),
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  logo,
                  width: widthSize(50),
                ),
                SizedBox(width: widthSize(4)),
                const Padding(
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: CText(
                    text: "AI DUO",
                    fontFamily: CFONT.BOLD,
                  ),
                )
              ],
            ),
            SizedBox(height: heightSize(20)),
            const CText(
              text: "Sessions",
              fontFamily: CFONT.MEDIUM,
              color: kTextSubtitleColor,
              size: 12,
            ),
            SizedBox(height: heightSize(10)),
            GestureDetector(
              onTap: () {
                appController.currentSession.value = sessionItem2;
              },
              child: Container(
                height: heightSize(40),
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kTextSubtitleColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(Values().boxRadius),
                ),
                child: const Center(
                  child: CText(
                    text: "Text to Image Converter",
                    size: 12,
                  ),
                ),
              ),
            ),
            SizedBox(height: heightSize(10)),
            GestureDetector(
              onTap: () {
                appController.currentSession.value = sessionItem1;
                Get.toNamed(Routes.SUBSCRIPTION_DISPLAY);
              },
              child: Container(
                height: heightSize(40),
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kTextSubtitleColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(Values().boxRadius),
                ),
                child: const Center(
                  child: CText(
                    text: "Image to Image Converter",
                    size: 12,
                  ),
                ),
              ),
            ),
            SizedBox(height: heightSize(20)),
            Divider(
              color: kTextSubtitleColor.withOpacity(0.8),
            ),
            SizedBox(height: heightSize(20)),
            const CText(
              text: "Account",
              fontFamily: CFONT.MEDIUM,
              color: kTextSubtitleColor,
              size: 12,
            ),
            SizedBox(height: heightSize(10)),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Feather.bell,
                    color: kTextTitleColor.withOpacity(0.8),
                    size: 18,
                  ),
                  SizedBox(width: widthSize(10)),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: CText(
                      text: "Notifications",
                      color: kTextTitleColor.withOpacity(0.8),
                      size: 12,
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: kPrimaryColor.withOpacity(0.2),
                    child: const CText(
                      text: "3",
                      size: 10,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: heightSize(15)),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Feather.settings,
                    color: kTextTitleColor.withOpacity(0.8),
                    size: 18,
                  ),
                  SizedBox(width: widthSize(10)),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: CText(
                      text: "Settings",
                      color: kTextTitleColor.withOpacity(0.8),
                      size: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: heightSize(60),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Values().boxRadius),
                border: Border.all(color: kTextSubtitleColor.withOpacity(0.5)),
              ),
              child: Row(
                children: [
                  RandomAvatar(
                    DateTime.now().toIso8601String(),
                    height: heightSize(40),
                    width: widthSize(40),
                    trBackground: true,
                  ),
                  SizedBox(width: widthSize(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CText(
                        text: "Not Subscribed",
                        size: 12,
                        height: 1.4,
                      ),
                      CText(
                        text: shortenText(appController.walletAddress.value, totalLength: 15),
                        size: 10,
                        height: 1.4,
                        color: kTextSubtitleColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: heightSize(40)),
          ],
        ),
      ),
    );
  }
}
