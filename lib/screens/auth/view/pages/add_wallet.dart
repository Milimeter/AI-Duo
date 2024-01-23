import 'package:ai_duo/constants/value.dart';
import 'package:flutter/material.dart';
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

class AddWallet extends StatefulWidget {
  const AddWallet({super.key});

  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  AuthController authController = Get.find();
  bool obscureText = true;
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
                        text: "Setup Wallet", //AI-Duo
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
                          Octicons.x,
                          color: kTextTitleColor,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: heightSize(30)),
                item(
                  icon: Octicons.plus,
                  description: "Generate a new wallet seed phrase.",
                  title: "Create New Wallet",
                  callback: () {
                    authController.createWallet();
                  },
                ),
                item(
                  icon: Octicons.download,
                  description: "Import your wallet seed phrase.",
                  title: "Import Wallet",
                  callback: () {
                    authController.importWallet();
                  },
                ),
                item(
                  icon: Octicons.git_branch,
                  description: "Connect WEB3 wallet (minimal access)",
                  title: "Connect Wallet",
                  callback: () {
                    authController.connectWallet();
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget item({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback callback,
  }) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: heightSize(80),
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Values().boxRadius),
        ),
        child: Row(
          children: [
            Icon(
              icon,
            ),
            SizedBox(width: widthSize(10)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      text: title,
                      size: 17,
                      fontFamily: CFONT.SEMIBOLD,
                      height: 1.4,
                    ),
                    CText(
                      text: description,
                      fontFamily: CFONT.REGULAR,
                      height: 1.4,
                      size: 13,
                      color: kTextSubtitleColor,
                    ),
                  ],
                ),
              ),
            ),
            const Icon(
              Feather.chevron_right,
              color: kTextSubtitleColor,
            ),
          ],
        ),
      ),
    );
  }
}
