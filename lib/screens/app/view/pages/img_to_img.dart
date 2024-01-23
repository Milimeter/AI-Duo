import 'package:ai_duo/constants/assets_path.dart';
import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/screens/app/controller/app_controller.dart';
import 'package:ai_duo/screens/app/view/components/gallery_image.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class ImgToImgSession extends StatefulWidget {
  const ImgToImgSession({super.key});

  @override
  State<ImgToImgSession> createState() => _ImgToImgSessionState();
}

class _ImgToImgSessionState extends State<ImgToImgSession> {
  AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image.asset(newsession),
            SizedBox(height: constraints.maxHeight * 0.01),
            // IntrinsicWidth(
            //   child: Container(
            //     height: heightSize(50),
            //     padding: const EdgeInsets.symmetric(horizontal: 13),
            //     decoration: BoxDecoration(
            //       color: kWhiteColor,
            //       borderRadius: BorderRadius.circular(Values().boxRadius),
            //     ),
            //     child: Row(
            //       children: [
            //         const Icon(Feather.image, color: kBackgroundColor),
            //         SizedBox(
            //           width: widthSize(5),
            //         ),
            //         const Padding(
            //           padding: EdgeInsets.only(top: 8.0),
            //           child: CText(
            //             text: "Enhance your Photos",
            //             textAlign: TextAlign.center,
            //             color: kBackgroundColor,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // SizedBox(height: heightSize(10)),
            Stack(
              children: [
                Container(
                  height: heightSize(200),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Values().boxRadius),
                    image: DecorationImage(
                      image: AssetImage(c),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: IntrinsicWidth(
                    child: Container(
                      height: heightSize(50),
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      decoration: BoxDecoration(
                        color: kWhiteColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(Values().boxRadius),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Feather.image,
                            color: kWhiteColor,
                          ),
                          SizedBox(
                            width: widthSize(5),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: CText(
                              text: "Enhance your Photos",
                              textAlign: TextAlign.center,
                              size: 14,
                              color: kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                      child: CText(
                        text:
                            "Create mind-blowing photos of you using the power of AI",
                        textAlign: TextAlign.start,
                        color: kWhiteColor,
                        fontFamily: CFONT.MEDIUM,
                        size: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: heightSize(20)),
            Row(
              children: [
                const CText(
                  text: "All Photos",
                  textAlign: TextAlign.start,
                  color: kTextTitleColor,
                  fontFamily: CFONT.BOLD,
                  size: 14,
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: kTextSubtitleColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Values().boxRadius),
                  ),
                  child: const Center(
                    child: CText(
                      text: "Open Gallery",
                      color: kTextTitleColor,
                      fontFamily: CFONT.MEDIUM,
                      size: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: heightSize(10)),
            // Obx(
            //   () => CText(
            //     text: "SessionID: ${appController.currentSession.value.id}",
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            const Expanded(child: GalleryImages())
          ],
        );
      }),
    );
  }
}
