import 'dart:typed_data';

import 'package:ai_duo/routes/app_pages.dart';
import 'package:ai_duo/shared/loaders.dart';
import 'package:flutter/material.dart';
import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class ImageViewOption extends StatefulWidget {
  final AssetEntity asset;
  const ImageViewOption({
    super.key,
    required this.asset,
  });

  @override
  State<ImageViewOption> createState() => _ImageViewOptionState();
}

class _ImageViewOptionState extends State<ImageViewOption> {
  Uint8List? imgBytes;
  bool isLoading = false;
  String loadingStep = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: Get.height * 0.5,
          //padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: kWhiteColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(Values().boxRadius),
          ),
          child: Stack(
            children: [
              FutureBuilder<Uint8List?>(
                future: widget.asset.originBytes,
                builder: (BuildContext context, snapshot) {
                  final bytes = snapshot.data;
                  imgBytes = bytes;
                  if (bytes == null) {
                    return const CircularProgressIndicator();
                  }
                  return Container(
                    height: Get.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Values().boxRadius),
                      image: DecorationImage(
                        image: Image.memory(bytes, fit: BoxFit.cover).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () async {
                      // Start loading
                      setState(() {
                        isLoading = true;
                        loadingStep = "Uploading Image";
                      });

                      // Simulate uploading image
                      await Future.delayed(const Duration(seconds: 2));

                      // Update loading step
                      setState(() {
                        loadingStep = "Retrieving Image";
                      });

                      // Simulate retrieving image
                      await Future.delayed(const Duration(seconds: 2));

                      // Update loading step
                      setState(() {
                        loadingStep = "Processing Image";
                      });

                      // Simulate processing image
                      await Future.delayed(const Duration(seconds: 2));

                      // End loading
                      setState(() {
                        isLoading = false;
                        loadingStep = "";
                      });
                      Get.toNamed(
                        Routes.FILTERS_PAGE,
                        arguments: {'bytes': imgBytes},
                      );
                    },
                    child: Container(
                      // height: heightSize(50),
                      // width: widthSize(200),
                      margin: const EdgeInsets.only(bottom: 18),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 13),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(Values().boxRadius),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Octicons.paintbrush),
                          SizedBox(
                            width: widthSize(5),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: CText(
                              text: "Apply AI Filters",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Loading overlay
              LoadingOverlay(
                isLoading: isLoading,
                loadingText: loadingStep,
              ),
            ],
          ),
        ),
        SizedBox(height: heightSize(30)),
      ],
    );
  }
}
