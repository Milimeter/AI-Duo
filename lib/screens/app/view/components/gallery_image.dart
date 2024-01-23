import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/screens/app/view/components/image_view_option.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryImages extends StatefulWidget {
  const GalleryImages({super.key});

  @override
  State<GalleryImages> createState() => _GalleryImagesState();
}

class _GalleryImagesState extends State<GalleryImages> {
  List<AssetEntity> assets = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _fetchAssets();
  }

  Future<void> _fetchAssets() async {
    log("gallery permissions 1denied");
    PermissionState permitted = await PhotoManager.requestPermissionExtend();
    if (permitted.isAuth) {
      List<AssetPathEntity> paths =
          await PhotoManager.getAssetPathList(onlyAll: true, type: RequestType.image);
      var path = paths.first;
      // You can optimize this fetch range.
      assets = await path.getAssetListPaged(page: 0, size: 80);

      // Filter out video assets
      assets = assets.where((asset) => asset.type != AssetType.video).toList();

      setState(() {
        loading = false;
      });
    } else {
      // handle denied permissions
      log("gallery permissions denied");
      PhotoManager.openSetting();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return loading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1,
              ),
              itemCount: assets.length,
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder<Uint8List?>(
                  future: assets[index].thumbnailData,
                  builder: (BuildContext context, snapshot) {
                    final bytes = snapshot.data;
                    if (bytes == null) {
                      return const CircularProgressIndicator();
                    }
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return FractionallySizedBox(
                                widthFactor: 0.93,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: ImageViewOption(
                                    asset: assets[index],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Values().boxRadius),
                              image: DecorationImage(
                                image: Image.memory(bytes, fit: BoxFit.cover)
                                    .image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            // Dark overlay for background video
                            color: const Color.fromRGBO(0, 0, 0, 0.10),
                            // color: const Color.fromRGBO(48, 46, 46, 0.60),
                          ),
                          Positioned.fill(
                            child: Align(
                              child: Icon(
                                Feather.plus,
                                size: 40,
                                color: kWhiteColor.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                    // return InkWell(
                    //   onTap: () {
                    //     // do something
                    //   },
                    //   child: Image.memory(bytes, fit: BoxFit.cover),
                    // );
                  },
                );
              },
            );
    });
  }
}
