// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:ai_duo/screens/app/controller/app_controller.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:factor_exchange/screens/app/controller/app_controller.dart';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// import 'package:your_crypto/screens/app/home/controller/home_controller.dart';

modalSetup(context,
    {required double modalPercentageHeight,
    required Widget createPage,
    required bool showBarrierColor}) {
  AppController appController = Get.find();
  return showBarModalBottomSheet(
    duration: const Duration(milliseconds: 100),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    ),
    context: context,
    barrierColor: showBarrierColor == true
        ? Colors.black.withOpacity(.6)
        : Colors.transparent,
    builder: (context) => Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: appController.keyBoardActive.value
            ? MediaQuery.of(context).size.height * modalPercentageHeight +
                MediaQuery.of(context).viewInsets.bottom
            : MediaQuery.of(context).size.height * modalPercentageHeight,
        child: createPage,
      ),
    ),
  );
}

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: kTransparent,
      builder: (BuildContext context) {
        return Container(
          height: heightSize(150),
          width: widthSize(200),
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.2),
          ),
          child: Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: kPrimaryColor,
              secondRingColor: kSecondaryColor,
              size: 60,
            ),
          ),
        );
      });
}

String formatMoney(amount) {
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  // ignore: prefer_function_declarations_over_variables
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  String result = amount.toString().replaceAllMapped(reg, mathFunc);
  return result;
}

String numberFormat(double n) {
  String num = n.toString();
  int len = num.length;

  if (n >= 1000 && n < 1000000) {
    return '${num.substring(0, len - 3)}.${num.substring(len - 3, 1 + (len - 3))}K';
  } else if (n >= 1000000 && n < 1000000000) {
    return '${num.substring(0, len - 6)}.${num.substring(len - 6, 1 + (len - 6))}M';
  } else if (n > 1000000000) {
    return '${num.substring(0, len - 9)}.${num.substring(len - 9, 1 + (len - 9))}B';
  } else {
    return num.toString();
  }
}

String truncate(String text, {required int length}) {
  String omission = '...';
  if (length >= text.length) {
    return text;
  }
  return text.replaceRange(length, text.length, omission);
}

String shortenText(String text, {required int totalLength}) {
  if (text.length <= totalLength) {
    return text;
  }
  int halfLength = totalLength ~/ 2;
  String start = text.substring(0, halfLength);
  String end = text.substring(text.length - halfLength, text.length);
  return "$start...$end";
}
