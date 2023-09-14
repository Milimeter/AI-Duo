import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:freckled_zelda/constants/assets_path.dart';
import 'package:freckled_zelda/constants/font_family.dart';
import 'package:freckled_zelda/screens/auth/view/components/intro_auth_dialog.dart';
import 'package:freckled_zelda/shared/action_button.dart';
import 'package:freckled_zelda/shared/custom_text.dart';
import 'package:freckled_zelda/utils/colors.dart';
import 'package:freckled_zelda/utils/sizes.dart';
import 'package:video_player/video_player.dart';

class AuthIntro extends StatefulWidget {
  const AuthIntro({super.key});

  @override
  State<AuthIntro> createState() => _AuthIntroState();
}

class _AuthIntroState extends State<AuthIntro> {
  late VideoPlayerController _controller;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(intro);
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      if (_controller.value.volume == 0.0) {
        isMuted = true;
      }

      setState(() {});
      Timer(const Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          // _visible = true;
        });
      });
    });
  }

  checkController() {
    log("checking here");
    double volume = _controller.value.volume;
    if (volume == 0.0) {
      setState(() {
        isMuted = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    checkController();
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
                    SizedBox(height: constraints.maxHeight * 0.03),
                    const Align(
                      child: CText(
                        text: "FRECKLED ZELDA",
                        size: 50,
                        fontFamily: CFontFamily.DongleBold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        isMuted = !isMuted;
                        if (isMuted) {
                          _controller.setVolume(0.0);
                        } else {
                          _controller.setVolume(1.0);
                        }
                        setState(() {});
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: kGreyColor.withOpacity(0.2),
                        child: Icon(
                          isMuted || _controller.value.volume == 0.0
                              ? Octicons.mute
                              : Octicons.unmute,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(height: heightSize(20)),
                    Row(
                      children: [
                        Expanded(
                          child: ActionButton(
                            text: "Login",
                            color: kWhiteColor.withOpacity(0.8),
                            textColor: kBackgroundColor,
                            callback: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return FractionallySizedBox(
                                      widthFactor: 0.93,
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: AuthIntroSignUpDialog(
                                          toSignup: false,
                                          controller: _controller,
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                        SizedBox(width: widthSize(10)),
                        Expanded(
                          child: ActionButton(
                            text: "Sign Up",
                            color: kWhiteColor.withOpacity(0.8),
                            textColor: kBackgroundColor,
                            callback: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return FractionallySizedBox(
                                      widthFactor: 0.93,
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: AuthIntroSignUpDialog(
                                          toSignup: true,
                                          controller: _controller,
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: heightSize(100)),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
