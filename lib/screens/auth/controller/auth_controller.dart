import "dart:developer";

import "package:ai_duo/constants/steps.dart";
import "package:ai_duo/constants/strings.dart";
import "package:ai_duo/routes/app_pages.dart";
import "package:ai_duo/services/storage.dart";
import "package:ai_duo/shared/custom_toast.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:trust_wallet_core_lib/trust_wallet_core_ffi.dart";
import "package:trust_wallet_core_lib/trust_wallet_core_lib.dart";

class AuthController extends GetxController {
  // TextEditingController emailSignupController = TextEditingController();
  // TextEditingController fullnameSignupController = TextEditingController();
  // TextEditingController passwordSignupController = TextEditingController();
  // TextEditingController emailSigninController = TextEditingController();
  // TextEditingController passwordSigninController = TextEditingController();
  // TextEditingController forgotPasswordController = TextEditingController();

  // RxString emailSignup = RxString("");
  // RxString fullnameSignup = RxString("");
  // RxString passwordSignup = RxString("");
  // RxString emailSignin = RxString("");
  // RxString passwordSignin = RxString("");
  // RxString forgotPassword = RxString("");
  RxList generatedMnemonics = [].obs;
  RxString enteredMnemonics = RxString("");

  RxString error = RxString("");
  RxBool load = RxBool(false);

  createWallet() async {
    try {
      Get.toNamed(Routes.CREATE_WALLET);
      HDWallet newWalletInstance = HDWallet();
      String mnemonics = newWalletInstance.mnemonic();
      await Storage.saveData(WALLET_MNEMONICS, mnemonics);
      log(mnemonics);
      generatedMnemonics.value = List.from(mnemonics.split(' '));
      String walletAddress =
          newWalletInstance.getAddressForCoin(TWCoinType.TWCoinTypePolygon);
      log(walletAddress);
      log('----- Polygon address: $walletAddress');
      if (generatedMnemonics.value.isNotEmpty) {
        //save phrases route
        Get.toNamed(Routes.CREATE_WALLET);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  importWallet() {
    try {
      Get.toNamed(Routes.IMPORT_WALLET);
    } catch (e) {
      log(e.toString());
    }
  }

  connectWallet() {
    try {
      cToast(title: "Notice", message: "Coming Soon.....");
    } catch (e) {
      log(e.toString());
    }
  }

  completeCreateWallet() async {
    try {
      await Storage.setStep(Steps.DONE);
      Get.toNamed(Routes.MAIN_APP);
    } catch (e) {
      log(e.toString());
    }
  }

  completeImportWallet({required String input}) async {
    try {
      // cToast(title: "Notice", message: "Coming Soon.....");
      HDWallet walletInstance = HDWallet.createWithMnemonic(input);
      String walletAddress =
          walletInstance.getAddressForCoin(TWCoinType.TWCoinTypePolygon);
      log("Polygon address: $walletAddress");
      await Storage.saveData(WALLET_MNEMONICS, input);
      await Storage.setStep(Steps.DONE);
      Get.toNamed(Routes.MAIN_APP);
    } catch (e) {
      log(e.toString());
    }
  }
}
