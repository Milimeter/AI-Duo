import 'dart:developer';

import 'package:ai_duo/routes/app_pages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ai_duo/constants/assets_path.dart';
import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/shared/action_button.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class AuthIntro extends StatefulWidget {
  const AuthIntro({super.key});

  @override
  State<AuthIntro> createState() => _AuthIntroState();
}

class _AuthIntroState extends State<AuthIntro> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(intro);
    _controller.addListener(() {
      setState(() {});
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

  int currentIndex = 0;
  List<String> textList = [
    'Create stunning ART with AI Duo',
    'Create face swaps with AI Duo',
    'AI personal assistant with AI Duo',
    'Generate text with Human like fluency',
    'Transform your selfies with AI Duo',
    'Create realistic images with AI Duo',
    'Choose from 100+ style ',
    'Create anime art with AI Duo',
    'Discover trendy styles'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: LayoutBuilder(builder: (context, constraints) {
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
            Container(
              // Dark overlay for background video
              color: const Color.fromRGBO(0, 0, 0, 0.50),
              // color: const Color.fromRGBO(48, 46, 46, 0.60),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  const Align(
                    child: CText(
                      text: "AI-DUO",
                      fontWeight: FontWeight.w600,
                      size: 21,
                      color: kWhiteColor,
                      height: 1.15,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: heightSize(50),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: kGreyColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(Values().boxRadius),
                    ),
                    child: Row(
                      children: [
                        const Icon(Octicons.hubot, color: kWhiteColor),
                        SizedBox(width: widthSize(5)),
                        Expanded(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              // height: 40,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                            items: textList
                                .map((item) => Builder(
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Center(
                                            child: CText(
                                              text: item,
                                              color: kWhiteColor,
                                              fontFamily: CFONT.BOLD,
                                            ),
                                          ),
                                        );
                                      },
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: heightSize(20)),
                  ActionButton(
                    text: "Get Started",
                    // color: kWhiteColor.withOpacity(0.8),
                    // textColor: kBackgroundColor,
                    callback: () {
                      Get.toNamed(Routes.ADD_WALLET);
                    },
                  ),
                  SizedBox(height: heightSize(100)),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
