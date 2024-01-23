import 'dart:async';
import 'dart:developer';

import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/screens/auth/controller/auth_controller.dart';
import 'package:ai_duo/shared/action_button.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/shared/custom_toast.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class ImportWallet extends StatefulWidget {
  const ImportWallet({super.key});

  @override
  State<ImportWallet> createState() => _ImportWalletState();
}

class _ImportWalletState extends State<ImportWallet> {
  AuthController authController = Get.find();
  TextEditingController textEditingController = TextEditingController();

  double _opacity = 1.0;
  double _opacity2 = 1.0;

  void _blinkText() async {
    setState(() => _opacity = 0.0); // Make the text invisible
    Timer(const Duration(milliseconds: 500), () {
      setState(() => _opacity = 1.0); // Bring it back to fully visible
    });
    ClipboardData? clipboardData =
        await Clipboard.getData(Clipboard.kTextPlain);
    String? clipboardText = clipboardData?.text;
    if (clipboardText != null) {
      log(clipboardText);
      textEditingController.text = clipboardText;
    }
  }

  void _blinkIcon() async {
    setState(() => _opacity2 = 0.0); // Make the text invisible
    Timer(const Duration(milliseconds: 500), () {
      setState(() => _opacity2 = 1.0); // Bring it back to fully visible
    });
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: constraints.maxHeight * 0.02),
                Row(
                  children: [
                    const Align(
                      child: CText(
                        text: "Import Phrases", //AI-Duo
                        size: 20,
                        fontFamily: CFONT.BOLD,
                        color: kPrimaryColor,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Icon(
                          Octicons.arrow_left,
                          color: kTextTitleColor,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: heightSize(40)),
                // const CText(
                //   text: "Secret phrase:",
                //   textAlign: TextAlign.start,
                //   color: kTextSubtitleColor,
                //   // color: isSelected ? kPrimaryColor : kTextSubtitleColor,
                //   size: 14,
                //   fontFamily: CFONT.REGULAR,
                // ),
                // SizedBox(height: heightSize(10)),
                Stack(
                  children: [
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
                        controller: textEditingController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        showCursor: true,
                        cursorColor: kPrimaryColor,
                        onChanged: (val) {
                          if (val.isNotEmpty && val.trim() != "") {
                            // isFieldEmpty = true;
                            // appController.checkIfTextToImageBtnReady(
                            //   isSelectedAspectRatio,
                            //   isSelectedStyleType,
                            //   isFieldEmpty,
                            // );
                          }
                        },
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: fontSize(16),
                          fontFamily: CFONT.MEDIUM,
                          height: 1.4,
                        ),
                        decoration: InputDecoration(
                          hintText: "",
                          hintStyle: TextStyle(
                            color: kWhiteColor.withOpacity(0.4),
                            fontSize: fontSize(16),
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
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 18, right: 18),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: _blinkText,
                                child: AnimatedOpacity(
                                  opacity: _opacity,
                                  duration: const Duration(milliseconds: 500),
                                  child: const CText(
                                    text: "Paste",
                                    textAlign: TextAlign.start,
                                    color: kPrimaryColor,
                                    size: 16,
                                    fontFamily: CFONT.SEMIBOLD,
                                  ),
                                ),
                              ),
                              SizedBox(width: widthSize(10)),
                              GestureDetector(
                                onTap: _blinkIcon,
                                child: AnimatedOpacity(
                                  opacity: _opacity2,
                                  duration: const Duration(milliseconds: 500),
                                  child: const Icon(
                                    FontAwesome.qrcode,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: heightSize(15)),
                const Align(
                  child: CText(
                    text:
                        "Enter your 12 secure phrase or words separated by single spaces",
                    //fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    color: kTextSubtitleColor,
                    height: 1.4,
                    // color: isSelected ? kPrimaryColor : kTextSubtitleColor,
                    size: 14,
                    fontFamily: CFONT.REGULAR,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ActionButton(
              text: "Continue",
              callback: () {
                String input = textEditingController.text.trim();
                List data = input.split(" ");
                if (data.length != 12) {
                  cToast(title: "Notice", message: "Phrase must be 12 words");
                } else {
                  authController.completeImportWallet(input: input);
                }
              },
            ),
            SizedBox(height: heightSize(40)),
          ],
        ),
      ),
    );
  }
}
