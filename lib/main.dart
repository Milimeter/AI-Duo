import 'package:ai_duo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ai_duo/routes/app_pages.dart';
import 'package:ai_duo/utils/size-config.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trust_wallet_core_lib/trust_wallet_core_lib.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TrustWalletCoreLib.init();
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put(DashboardController());
  await GetStorage.init();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle.light.copyWith(
  //     statusBarColor: kPrimaryColor,
  //     statusBarIconBrightness: Brightness.light,
  //   ),
  // );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    // Get.put(AppController());
    runApp(const InitClass());
  });
}

class InitClass extends StatelessWidget {
  const InitClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
      return GetMaterialApp(
        title: "AI Duo",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.SPLASHSCREEN,
        getPages: AppPages.routes,
      );
    });
  }
}
