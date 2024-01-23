import 'dart:async';

import 'package:ai_duo/constants/assets_path.dart';
import 'package:ai_duo/models/sessions.dart';
import 'package:ai_duo/routes/app_pages.dart';
import 'package:ai_duo/screens/app/controller/app_controller.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:ai_duo/utils/utilities.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:get/get.dart';
import 'package:localstore/localstore.dart';

import '../modals/create_session.dart';

class SessionDrawer extends StatefulWidget {
  const SessionDrawer({super.key});

  @override
  State<SessionDrawer> createState() => _SessionDrawerState();
}

class _SessionDrawerState extends State<SessionDrawer> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          // width: constraints.maxWidth * 0.4,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: kTextSubtitleColor, // kContainerColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: constraints.maxHeight * 0.03),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: kGreyColor.withOpacity(0.2),
                    radius: 22,
                    child: Icon(
                      Octicons.person,
                      color: kWhiteColor.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(width: widthSize(10)),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CText(
                      text: shortenText("fgfuivuifidkfifghfigfivi",
                          totalLength: 13),
                    ),
                  ),
                ],
              ),
              // item(),
              SizedBox(height: heightSize(40)),
              const CText(
                text: "Menu",
                fontFamily: CFONT.MEDIUM,
              ),
              SizedBox(height: heightSize(20)),
              sessionItem(
                item: sessionItem1,
                icon: Octicons.image,
                text: "Img2Img",
              ),
              sessionItem(
                item: sessionItem2,
                icon: Octicons.list_unordered,
                text: "Txt2Img",
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget item() {
    return GestureDetector(
      onTap: () {
        modalSetup(
          context,
          modalPercentageHeight: 0.9,
          createPage: const CreateSession(),
          showBarrierColor: true,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: kGreyColor.withOpacity(0.1),
          child: const Icon(
            Feather.plus,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }

  Widget sessionItem(
      {required Session item, required IconData icon, required String text}) {
    return GestureDetector(
      onTap: () {
        appController.currentSession.value = item;
        Get.toNamed(Routes.SUBSCRIPTION_DISPLAY);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            Icon(
              icon,
              color: kWhiteColor.withOpacity(0.5),
              size: 22,
            ),
            SizedBox(width: widthSize(10)),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CText(
                text: text,
                size: 14,
                fontFamily: CFONT.REGULAR,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
