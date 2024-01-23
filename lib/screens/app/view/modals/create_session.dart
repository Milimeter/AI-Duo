import 'dart:developer';

import 'package:ai_duo/constants/assets_path.dart';
import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/models/sessions.dart';
import 'package:ai_duo/screens/app/controller/app_controller.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CreateSession extends StatefulWidget {
  const CreateSession({super.key});

  @override
  State<CreateSession> createState() => _CreateSessionState();
}

class _CreateSessionState extends State<CreateSession> {
  late VideoPlayerController _controller;
  AppController appController = Get.find();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(create);
    _controller.addListener(() {
      // setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.setVolume(0);
    _controller.play();
  }

  @override
  void dispose() {
    if (_controller.value.isPlaying) _controller.pause();
    _controller.dispose().then((value) => log("Video Controller Disposed"));
    super.dispose();
  }

  List<Options> options = [
    Options(
      name: "Image to Image",
      image: img2img,
      createSessionType: SessionType.IMAGE_TO_IMAGE,
    ),
    Options(
      name: "Text to Image",
      image: img2img,
      createSessionType: SessionType.TEXT_TO_IMAGE,
    ),
    Options(
      name: "Image to Video",
      image: img2img,
      createSessionType: SessionType.IMAGE_TO_VIDEO,
    ),
    Options(
      name: "AI assistant",
      image: img2img,
      createSessionType: SessionType.AI_ASSISTANT,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              // Container(
              //   // Dark overlay for background video
              //   color: const Color.fromRGBO(0, 0, 0, 0.50),
              //   // color: const Color.fromRGBO(48, 46, 46, 0.60),
              // ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Container(
                      height: heightSize(300),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      margin: const EdgeInsets.only(bottom: 40),
                      decoration: BoxDecoration(
                        color: kBackgroundColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(Values().boxRadius),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: heightSize(10)),
                          const Align(
                            child: CText(
                              text: "Select Option",
                              size: 50,
                              fontFamily: CFONT.BOLD,
                              height: 0,
                              color: kWhiteColor,
                            ),
                          ),
                          SizedBox(height: heightSize(20)),
                          Align(
                            child: Wrap(
                                runSpacing: 22,
                                spacing: 22,
                                runAlignment: WrapAlignment.center,
                                children: [
                                  ...options
                                      .map((e) => item(option: e))
                                      .toList(),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget item({required Options option}) {
    return GestureDetector(
      onTap: () {
        appController.createNewSession(
          sessionType: option.createSessionType,
        );
      },
      child: Column(
        children: [
          Container(
            height: heightSize(60),
            width: widthSize(60),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(Values().boxRadius),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(option.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CText(
            text: option.name,
            fontFamily: CFONT.REGULAR,
          )
        ],
      ),
    );
  }
}

class Options {
  final String name;
  final String image;
  final String createSessionType;

  Options({
    required this.name,
    required this.image,
    required this.createSessionType,
  });
}
