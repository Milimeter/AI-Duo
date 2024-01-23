import 'dart:async';

import 'package:ai_duo/constants/assets_path.dart';
import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/screens/app/controller/app_controller.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextToImgSession extends StatefulWidget {
  const TextToImgSession({super.key});

  @override
  State<TextToImgSession> createState() => _TextToImgSessionState();
}

class _TextToImgSessionState extends State<TextToImgSession> {
  AppController appController = Get.find();
  bool isSelectedAspectRatio = false;
  bool isSelectedStyleType = false;
  bool isFieldEmpty = false;
  List variations = [
    painting,
    threeD,
    anime,
    cyberpunk,
    vintage,
    comic,
    cartoon,
    pencil,
    model,
  ];
  List variationNames = [
    'painting',
    '3D',
    'anime',
    'cyberpunk',
    'vintage',
    'comic',
    'cartoon',
    'pencil',
    'model',
  ];
  int selectedVariationIndex = -1;
  @override
  void initState() {
    resetState();
    super.initState();
  }

  resetState() {
    isSelectedAspectRatio = false;
    isSelectedStyleType = false;
    isFieldEmpty = false;
    appController.unselectAspectRatio();
    appController.textToIMGController.clear();
    Timer(const Duration(milliseconds: 500), () {
      appController.isTextToImageBtnReady.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: constraints.maxHeight * 0.01),
              Container(
                //height: heightSize( 65),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: kGreyColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(Values().boxRadius),
                ),
                child: TextFormField(
                  controller: appController.textToIMGController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  showCursor: true,
                  cursorColor: kPrimaryColor,
                  onChanged: (val) {
                    if (val.isNotEmpty && val.trim() != "") {
                      isFieldEmpty = true;
                      appController.checkIfTextToImageBtnReady(
                        isSelectedAspectRatio,
                        isSelectedStyleType,
                        isFieldEmpty,
                      );
                    }
                  },
                  style: TextStyle(
                    color: kTextTitleColor,
                    fontSize: fontSize(16),
                    fontFamily: CFONT.MEDIUM,
                  ),
                  decoration: InputDecoration(
                    hintText: "Write whatever you want to see...",
                    hintStyle: TextStyle(
                      color: kTextSubtitleColor,
                      fontSize: fontSize(14),
                      fontFamily: CFONT.REGULAR,
                    ),

                    // hintStyle: GoogleFonts.sansita(
                    //   color: kWhite,
                    // ),

                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: heightSize(15)),
              const CText(
                text: "Aspect ratio",
                textAlign: TextAlign.start,
                color: kWhiteColor,
                fontFamily: CFONT.BOLD,
              ),
              SizedBox(height: heightSize(15)),
              Obx(
                () => Row(
                  children: [
                    sizeItem(
                      text: "Square",
                      height: heightSize(50),
                      width: widthSize(50),
                      isSelected:
                          appController.isSquareAspectRatio.value == true
                              ? true
                              : false,
                      callback: () {
                        appController.selectSquareAspectRatio();
                        isSelectedAspectRatio = true;
                        appController.checkIfTextToImageBtnReady(
                          isSelectedAspectRatio,
                          isSelectedStyleType,
                          isFieldEmpty,
                        );
                      },
                    ),
                    SizedBox(width: widthSize(10)),
                    sizeItem(
                      text: "Portrait",
                      height: heightSize(70),
                      width: widthSize(40),
                      isSelected:
                          appController.isPortraitAspectRatio.value == true
                              ? true
                              : false,
                      callback: () {
                        appController.selectPortraitAspectRatio();
                        isSelectedAspectRatio = true;
                        appController.checkIfTextToImageBtnReady(
                          isSelectedAspectRatio,
                          isSelectedStyleType,
                          isFieldEmpty,
                        );
                      },
                    ),
                    SizedBox(width: widthSize(10)),
                    sizeItem(
                      text: "Landscape",
                      height: heightSize(40),
                      width: widthSize(70),
                      isSelected:
                          appController.isLandscapeAspectRatio.value == true
                              ? true
                              : false,
                      callback: () {
                        appController.selectLandscapeAspectRatio();
                        isSelectedAspectRatio = true;
                        appController.checkIfTextToImageBtnReady(
                          isSelectedAspectRatio,
                          isSelectedStyleType,
                          isFieldEmpty,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: heightSize(15)),
              const CText(
                text: "Style",
                textAlign: TextAlign.start,
                color: kWhiteColor,
                fontFamily: CFONT.BOLD,
              ),
              SizedBox(height: heightSize(15)),
              Wrap(
                runAlignment: WrapAlignment.center,
                runSpacing: 20,
                spacing: 10,
                children: [
                  ...variations.map((e) => styleItem(image: e)).toList(),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget styleItem({required String image}) {
    int index = variations.indexOf(image);
    return GestureDetector(
      onTap: () {
        selectedVariationIndex = index;
        isSelectedStyleType = true;
        appController.checkIfTextToImageBtnReady(
          isSelectedAspectRatio,
          isSelectedStyleType,
          isFieldEmpty,
        );
        setState(() {});
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: heightSize(80),
            width: widthSize(80),
            decoration: BoxDecoration(
              // color: isSelected ? kPrimaryColor : kGreyColor.withOpacity(0.1),

              borderRadius: BorderRadius.circular(Values().boxRadius),
              border: Border.all(
                color: selectedVariationIndex == index
                    ? kPrimaryColor
                    : Colors.transparent,
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: heightSize(10)),
          CText(
            text: variationNames[index].toString().capitalizeFirst!,
            textAlign: TextAlign.start,
            color: selectedVariationIndex == index
                ? kPrimaryColor
                : kTextTitleColor,
            size: 14,
            fontFamily: CFONT.REGULAR,
          ),
        ],
      ),
    );
  }

  Widget sizeItem({
    required String text,
    required double width,
    required double height,
    required bool isSelected,
    required VoidCallback callback,
  }) {
    return GestureDetector(
      onTap: callback,
      child: Column(
        children: [
          Container(
            height: heightSize(90),
            width: widthSize(90),
            decoration: BoxDecoration(
              color: isSelected ? kPrimaryColor : kGreyColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(Values().boxRadius),
            ),
            child: Center(
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? kBackgroundColor : kTextSubtitleColor,
                  ),
                  borderRadius: BorderRadius.circular(Values().boxRadius),
                ),
              ),
            ),
          ),
          SizedBox(height: heightSize(10)),
          CText(
            text: text,
            textAlign: TextAlign.start,
            color: isSelected ? kPrimaryColor : kTextTitleColor,
            size: 14,
            fontFamily: CFONT.REGULAR,
          ),
        ],
      ),
    );
  }
}
