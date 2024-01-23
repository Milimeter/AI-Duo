import 'package:ai_duo/constants/assets_path.dart';
import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/shared/action_button.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class SubscriptionDisplay extends StatefulWidget {
  const SubscriptionDisplay({super.key});

  @override
  State<SubscriptionDisplay> createState() => _SubscriptionDisplayState();
}

class _SubscriptionDisplayState extends State<SubscriptionDisplay> {
  bool litePlanSelected = false;
  bool proPlanSelected = false;
  bool monthlyPlanSelected = false;
  bool weeklyPlanSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: constraints.maxHeight * 0.02),
                  Row(
                    children: [
                      const Align(
                        child: CText(
                          text: "Choose a Plan", //AI-Duo
                          size: 20,
                          fontFamily: CFONT.BOLD,
                          color: kPrimaryColor,
                        ),
                      ),
                      const Spacer(),
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
                    ],
                  ),
                  SizedBox(height: heightSize(20)),
                  SizedBox(
                    height: heightSize(200),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        litePlanItem(),
                        proPlanItem(),
                      ],
                    ),
                  ),
                  SizedBox(height: heightSize(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 4,
                        backgroundColor: kTextSubtitleColor,
                      ),
                      SizedBox(width: widthSize(10)),
                      const CircleAvatar(
                        radius: 4,
                        backgroundColor: kTextSubtitleColor,
                      ),
                    ],
                  ),
                  SizedBox(height: heightSize(40)),
                  GestureDetector(
                    onTap: () {
                      monthlyPlanSelected = true;
                      weeklyPlanSelected = false;
                      setState(() {});
                    },
                    child: Container(
                      height: heightSize(80),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: kGreyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(Values().boxRadius),
                        border: Border.all(
                          color: monthlyPlanSelected
                              ? kPrimaryColor
                              : Colors.transparent,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                polygon,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF8247e5),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CText(
                                    text: "Monthly Payment",
                                    size: 20,
                                    fontFamily: CFONT.BOLD,
                                    height: 1.4,
                                  ),
                                  //SizedBox(height: heightSize(5)),
                                  CText(
                                    text: litePlanSelected
                                        ? "1.95 MATIC ≈ \$1.00"
                                        : "3.9 MATIC ≈ \$2.00",
                                    size: 12,
                                    color: kTextTitleColor,
                                    height: 1.4,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: heightSize(10)),
                  GestureDetector(
                    onTap: () {
                      weeklyPlanSelected = true;
                      monthlyPlanSelected = false;
                      setState(() {});
                    },
                    child: Container(
                      height: heightSize(80),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: kGreyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(Values().boxRadius),
                        border: Border.all(
                          color: weeklyPlanSelected
                              ? const Color(0xFF8247e5)
                              : Colors.transparent,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                polygon,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF8247e5),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CText(
                                    text: "Weekly Payment",
                                    size: 20,
                                    fontFamily: CFONT.BOLD,
                                    height: 1.4,
                                  ),
                                  //SizedBox(height: heightSize(5)),
                                  CText(
                                    text: litePlanSelected
                                        ? "0.45 MATIC ≈ \$0.23"
                                        : "0.9 MATIC ≈ \$0.46",
                                    size: 12,
                                    color: kTextTitleColor,
                                    height: 1.4,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: heightSize(20)),
                  ActionButton(
                    text: "Continue",
                    callback: () {},
                  ),
                  SizedBox(height: heightSize(20)),
                  CText(
                    text:
                        "By subscribing to our service, You authorize AI Duo to automatically deduct fees from your in-app wallet on a weekly/monthly basis, based on the subscription plan you've chosen. AI Duo is not liable for financial decisions or losses arising from app use. Always review your subscription and wallet balance. It's your responsibility to monitor your subscription status and ensure sufficient funds in your in-app wallet for deductions. Your continued use signifies acceptance of these terms.",
                    size: 12,
                    color: kTextTitleColor.withOpacity(0.8),
                    height: 1.4,
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget litePlanItem() {
    return GestureDetector(
      onTap: () {
        litePlanSelected = true;
        proPlanSelected = false;
        setState(() {});
      },
      child: Stack(
        children: [
          Container(
            height: heightSize(200),
            width: Get.width * 0.85,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: kGreyColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(Values().boxRadius),
              border: Border.all(
                color: litePlanSelected ? kPrimaryColor : Colors.transparent,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: heightSize(10)),
                const CText(
                  text: "Lite",
                  size: 30,
                  fontFamily: CFONT.BOLD,
                ),
                SizedBox(height: heightSize(20)),
                const CText(
                  text: "30 Text to Image Generation",
                  height: 0.8,
                  color: kTextTitleColor,
                  size: 14,
                ),
                SizedBox(height: heightSize(10)),
                const CText(
                  text: "30 Image to Image Enhancer",
                  height: 0.8,
                  color: kTextTitleColor,
                  size: 14,
                ),
                SizedBox(height: heightSize(10)),
                const CText(
                  text: "30 Regeneration",
                  color: kTextTitleColor,
                  height: 0.8,
                  size: 14,
                ),
                SizedBox(height: heightSize(10)),
                const CText(
                  text: "No Ads",
                  color: kTextTitleColor,
                  height: 0.8,
                  size: 14,
                ),
                SizedBox(height: heightSize(10)),
                const CText(
                  text: "Unlimited Image Downloads",
                  color: kTextTitleColor,
                  height: 0.8,
                  size: 14,
                )
              ],
            ),
          ),
          // Positioned.fill(
          //   child: Align(
          //     alignment: Alignment.centerRight,
          //     child: Container(
          //       margin: const EdgeInsets.only(right: 14),
          //       child: Container(
          //         height: heightSize(195),
          //         width: Get.width * 0.30,
          //         // margin: const EdgeInsets.only(right: 14),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(Values().boxRadius),
          //           image: DecorationImage(
          //             image: AssetImage(b),
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ).blurred(
          //         blur: 1,
          //         colorOpacity: 0.05,
          //         // blurColor: kWhiteColor.withOpacity(0.4),
          //         borderRadius: BorderRadius.circular(Values().boxRadius),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget proPlanItem() {
    return GestureDetector(
      onTap: () {
        proPlanSelected = true;
        litePlanSelected = false;
        setState(() {});
      },
      child: Container(
        height: heightSize(200),
        width: Get.width * 0.85,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Values().boxRadius),
          border: Border.all(
            color: proPlanSelected ? kPrimaryColor : Colors.transparent,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: heightSize(10)),
            const CText(
              text: "Pro",
              size: 30,
              fontFamily: CFONT.BOLD,
            ),
            SizedBox(height: heightSize(20)),
            const CText(
              text: "100 Text to Image Generation",
              height: 0.8,
              color: kTextTitleColor,
              size: 14,
            ),
            SizedBox(height: heightSize(10)),
            const CText(
              text: "100 Image to Image Enhancer",
              height: 0.8,
              color: kTextTitleColor,
              size: 14,
            ),
            SizedBox(height: heightSize(10)),
            const CText(
              text: "100 Regeneration",
              height: 0.8,
              color: kTextTitleColor,
              size: 14,
            ),
            SizedBox(height: heightSize(10)),
            const CText(
              text: "No Ads",
              height: 0.8,
              color: kTextTitleColor,
              size: 14,
            ),
            SizedBox(height: heightSize(10)),
            const CText(
              text: "Unlimited Image Downloads",
              height: 0.8,
              color: kTextTitleColor,
              size: 14,
            )
          ],
        ),
      ),
    );
  }
}
