import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freckled_zelda/constants/font_family.dart';
import 'package:freckled_zelda/routes/app_pages.dart';
import 'package:freckled_zelda/utils/colors.dart';
import 'package:freckled_zelda/utils/size-config.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  //await dotenv.load();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: kBackgroundColor,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: kBackgroundColor,
  ));
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  ).then((_) {
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
        title: "Yomkitop Arbitrage",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.SPLASHSCREEN,
        getPages: AppPages.routes,
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: CFontFamily.DongleBold,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: kBackgroundColor,
            dividerColor: kBackgroundColor,
            textTheme:
                (Theme.of(context).textTheme).apply(displayColor: Colors.white),
            appBarTheme: const AppBarTheme(
              centerTitle: false,
              elevation: 0,
              backgroundColor: kAppBarDark,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity),
      );
    });
  }
}
