// import 'package:flutter/material.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:ai_duo/constants/value.dart';
// import 'package:ai_duo/routes/app_pages.dart';
// import 'package:ai_duo/shared/action_button.dart';
// import 'package:ai_duo/shared/custom_text.dart';
// import 'package:ai_duo/utils/colors.dart';
// import 'package:ai_duo/utils/sizes.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';

// class AuthIntroSignUpDialog extends StatelessWidget {
//   final VideoPlayerController controller;
//   final bool toSignup;
//   const AuthIntroSignUpDialog(
//       {super.key, required this.toSignup, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Container(
//           height: Get.height * 0.5,
//           padding: const EdgeInsets.symmetric(horizontal: 18),
//           decoration: BoxDecoration(
//             color: kBackgroundColor,
//             borderRadius: BorderRadius.circular(Values().boxRadius),
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: Get.height * 0.03),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: GestureDetector(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: CircleAvatar(
//                     radius: 20,
//                     backgroundColor: kGreyColor.withOpacity(0.2),
//                     child: const Icon(
//                       Octicons.x,
//                       color: kWhiteColor,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: heightSize(10)),
//               CText(
//                 text: "Select Sign ${toSignup ? 'Up' : 'In'} Option...",
//                 size: 30,
//                 fontFamily: CFONT.BOLD,
//               ),
//               SizedBox(height: heightSize(30)),
//               ActionButton(
//                 text: "Sign ${toSignup ? 'Up' : 'In'} with Google",
//                 color: const Color(0xFF4285F4),
//                 callback: () {},
//               ),
//               SizedBox(height: heightSize(20)),
//               CText(
//                 text: "Sign ${toSignup ? 'Up' : 'In'} with Email",
//                 fontWeight: FontWeight.w500,
//                 size: 28,
//                 fontFamily: CFONT.BOLD,
//                 onClick: () {
//                   controller.setVolume(0.0);
//                   if (toSignup) {
//                     Get.toNamed(Routes.SIGNUP_SCREEN);
//                   } else {
//                     Get.toNamed(Routes.LOGIN_SCREEN);
//                   }
//                 },
//                 // letterSpacing: 2,
//               ),
//               // ActionButton(
//               //   text: "Sign up with Email",
//               //   callback: () {},
//               // ),
//             ],
//           ),
//         ),
//         SizedBox(height: heightSize(30)),
//       ],
//     );
//   }
// }
