import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../../../constants/assets_path.dart';

class TxtToImgOutput extends StatefulWidget {
  const TxtToImgOutput({super.key});

  @override
  State<TxtToImgOutput> createState() => _TxtToImgOutputState();
}

class _TxtToImgOutputState extends State<TxtToImgOutput> {
  List variations = [
    painting,
    threeD,
    anime,
    cyberpunk,
    vintage,
    comic,
    cartoon,
    pencil,
    model
  ];
  int selectedVariationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: constraints.maxHeight * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
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
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Align(
                        child: CText(
                          text: "Output",
                          size: 21,
                          fontFamily: CFONT.BOLD,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: heightSize(40),
                      width: widthSize(40),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular(Values().boxRadius),
                        color: kWhiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Octicons.download,
                        color: kTextTitleColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    b,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: heightSize(10)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CText(
                  text: "Regenerate with style",
                  fontFamily: CFONT.REGULAR,
                  color: kWhiteColor.withOpacity(0.8),
                ),
              ),
              SizedBox(height: heightSize(10)),
              Container(
                height: heightSize(50),
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: variations.length,
                  itemBuilder: (context, index) {
                    return filterVariation(
                      img: variations[index],
                      index: index,
                    );
                  },
                ),
              ),
              SizedBox(height: heightSize(20)),
            ],
          );
        }),
      ),
    );
  }

  Widget filterVariation({required String img, required int index}) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            selectedVariationIndex = index;
            setState(() {});
          },
          child: Container(
            height: heightSize(50),
            width: widthSize(50),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: kBackgroundColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(Values().boxRadius),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        selectedVariationIndex == index
            ? Container(
                // Dark overlay for background video
                color: const Color.fromRGBO(0, 0, 0, 0.50),
                // color: const Color.fromRGBO(48, 46, 46, 0.60),
              )
            : const SizedBox.shrink(),
        selectedVariationIndex == index
            ? const Positioned.fill(
                child: Align(
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: kWhiteColor,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
