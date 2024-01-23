import 'dart:async';
import 'dart:io';

import 'package:ai_duo/constants/strings.dart';
import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/services/storage.dart';
import 'package:ai_duo/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ai_duo/routes/app_pages.dart';
import 'package:ai_duo/screens/auth/controller/auth_controller.dart';
import 'package:ai_duo/services/extensions.dart';
import 'package:ai_duo/shared/action_button.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/shared/custom_textfield.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:get/get.dart';

class CreateWallet extends StatefulWidget {
  const CreateWallet({super.key});

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {
  AuthController authController = Get.find();
  bool obscureText = true;

  double _opacity = 1.0;

  void _blinkText() async {
    setState(() => _opacity = 0.0); // Make the text invisible
    Timer(const Duration(milliseconds: 500), () {
      setState(() => _opacity = 1.0); // Bring it back to fully visible
    });
    String walletMnemonics = await Storage.readData(WALLET_MNEMONICS);
    ClipboardData data = ClipboardData(text: walletMnemonics);
    await Clipboard.setData(data);
    // cToast(
    //     title: "Notice",
    //     message: "Successfully copied secret phrase to clipboard");
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
                        text: "Secret Phrase", //AI-Duo
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
                Align(
                  child: Wrap(
                    runSpacing: 20,
                    spacing: 10,
                    runAlignment: WrapAlignment.center,
                    children: [
                      ...authController.generatedMnemonics
                          .map((e) => item(e))
                          .toList()
                    ],
                  ),
                ),
                SizedBox(height: heightSize(30)),
                GestureDetector(
                  onTap: _blinkText,
                  child: AnimatedOpacity(
                    opacity: _opacity,
                    duration: const Duration(milliseconds: 500),
                    child: Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Octicons.copy,
                            size: 15,
                            color: kTextSubtitleColor,
                          ),
                          SizedBox(width: widthSize(10)),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: CText(
                              text: "Copy to Clipboard",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: heightSize(70),
                  width: constraints.maxWidth,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: kGreyColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(Values().boxRadius),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Octicons.alert,
                        size: 15,
                        color: kTextSubtitleColor,
                      ),
                      SizedBox(width: widthSize(10)),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: CText(
                            text:
                                "Please carefully write down these 12 words and do not share your secret phrase with anyone, and store it securely!",
                            size: 14,
                          ),
                        ),
                      ),
                      const Icon(
                        Feather.chevron_right,
                        size: 15,
                        color: kTextSubtitleColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: heightSize(30)),
                ActionButton(
                  text: "Continue",
                  callback: () {
                    authController.completeCreateWallet();
                  },
                ),
                SizedBox(height: heightSize(40)),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget item(text) {
    int number = authController.generatedMnemonics.indexOf(text);
    return Stack(
      children: [
        Container(
          height: heightSize(45),
          width: widthSize(80),
          //padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: kGreyColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(Values().boxRadius),
          ),
          child: Center(
            child: CText(
              text: text,
              // color: kPrimaryColor,
              size: 13,
              fontFamily: CFONT.MEDIUM,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: kPrimaryColor,
              child: CText(
                  text: '${number + 1}',
                  size: 10,
                  textAlign: TextAlign.center,
                  color: kWhiteColor
                  // color: kBlackColor,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
