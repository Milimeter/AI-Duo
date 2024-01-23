import 'dart:async';
import 'dart:developer';

import 'package:ai_duo/constants/assets_path.dart';
import 'package:ai_duo/constants/get_wallet.dart';
import 'package:ai_duo/models/sessions.dart';
import 'package:ai_duo/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:localstore/localstore.dart';

class AppController extends GetxController {
  RxBool keyBoardActive = false.obs;
  late StreamSubscription<bool> keyboardSubscription;
  Rx<Session> currentSession = Session().obs;
  RxBool isSquareAspectRatio = RxBool(false);
  RxBool isPortraitAspectRatio = RxBool(false);
  RxBool isLandscapeAspectRatio = RxBool(false);

  RxBool isTextToImageBtnReady = RxBool(false);
  RxBool isTextToImageArtLoading = RxBool(false);
  TextEditingController textToIMGController = TextEditingController();
  RxString walletAddress = RxString("");

  checkIfTextToImageBtnReady(
      bool aspectRatioSelected, bool styleSelected, bool isFieldEmpty) {
    if (aspectRatioSelected && styleSelected && isFieldEmpty) {
      isTextToImageBtnReady.value = true;
    } else {
      isTextToImageBtnReady.value = false;
    }
  }

  unselectAspectRatio() {
    isSquareAspectRatio.value = false;
    isPortraitAspectRatio.value = false; //
    isLandscapeAspectRatio.value = false;
  }

  selectSquareAspectRatio() {
    isSquareAspectRatio.value = true;
    isPortraitAspectRatio.value = false; //
    isLandscapeAspectRatio.value = false;
  }

  selectPortraitAspectRatio() {
    isPortraitAspectRatio.value = true; //
    isSquareAspectRatio.value = false;
    isLandscapeAspectRatio.value = false;
  }

  selectLandscapeAspectRatio() {
    isLandscapeAspectRatio.value = true;
    isSquareAspectRatio.value = false;
    isPortraitAspectRatio.value = false; //
  }

  createNewSession({required String sessionType}) async {
    final id = Localstore.instance.collection('Session').doc().id;
    final now = DateTime.now();
    final sessionItem = Session(
      id: id,
      sessionType: sessionType,
      sessionImage: img2img,
      sessionTime: now,
      sessionData: {},
    );
    sessionItem.save();
    currentSession.value = sessionItem;
    Navigator.pop(Get.overlayContext!);
    cToast(title: "Notice", message: "Session created Successfully");
  }

  getWalletDetails() async {
    walletAddress.value =
        await ReturnWalletAddress(symbol: "MATIC").getWalletAddress();
  }

  @override
  void onReady() {
    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    log('Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');
    // Subscribe
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      keyBoardActive.value = visible;
      log('Keyboard visibility update. Is visible: $visible');
    });
    getWalletDetails();
    super.onReady();
  }
}
