import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:freckled_zelda/routes/app_pages.dart';
import 'package:freckled_zelda/screens/auth/controller/auth_controller.dart';
import 'package:freckled_zelda/services/extensions.dart';
import 'package:freckled_zelda/shared/action_button.dart';
import 'package:freckled_zelda/shared/custom_text.dart';
import 'package:freckled_zelda/shared/custom_textfield.dart';
import 'package:freckled_zelda/utils/colors.dart';
import 'package:freckled_zelda/utils/sizes.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  AuthController authController = Get.find();
  bool obscureText = true;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: constraints.maxHeight * 0.02),
                Row(
                  children: [
                    const Align(
                      child: CText(
                        text: "AI-Duo",
                        size: 50,
                        fontFamily: CFONT.BOLD,
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
                          color: kWhiteColor,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: heightSize(30)),
                Align(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: heightSize(80),
                      width: widthSize(80),
                      decoration: BoxDecoration(
                        color: kGreyColor.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Octicons.plus,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
                const Align(
                  child: CText(
                    text: "Add Profile Picture",
                    height: 1.5,
                  ),
                ),
                SizedBox(height: heightSize(20)),
                AuthTextField(
                  hint: "Full name",
                  controller: authController.fullnameSignupController,
                  error: authController.error.value,
                  inputType: TextInputType.text,
                  validFunction: (v) => v!,
                  onSavedFunction: (s) => {
                    if (s.isNotEmpty)
                      {
                        authController.error.value = '',
                        authController.fullnameSignup.value = s,
                        //print(email);
                      }
                    else
                      {
                        authController.error.value = "Invalid Full Name",
                        authController.fullnameSignup.value = '',
                      }
                  },
                ),
                SizedBox(height: heightSize(30)),
                AuthTextField(
                  hint: "Email Address",
                  controller: authController.emailSignupController,
                  error: authController.error.value,
                  inputType: TextInputType.emailAddress,
                  validFunction: (v) => v!,
                  onSavedFunction: (s) => {
                    if (s.isValidEmail())
                      {
                        authController.error.value = '',
                        authController.emailSignup.value = s,
                        //print(email);
                      }
                    else
                      {
                        authController.error.value = "Invalid email address",
                        authController.emailSignup.value = '',
                      }
                  },
                ),
                SizedBox(height: heightSize(20)),
                AuthTextField(
                  hint: "Password",
                  controller: authController.passwordSignupController,
                  error: authController.error.value,
                  inputType: TextInputType.visiblePassword,
                  isPassword: true,
                  obscureText: obscureText,
                  tapCallback: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  validFunction: (v) => v!,
                  onSavedFunction: (s) => {
                    if (s.isValidPassword())
                      {
                        authController.error.value = '',
                        authController.passwordSignup.value = s,
                        //print(email);
                      }
                    else
                      {
                        authController.error.value =
                            "Password must be minimum of eight characters, at least one uppercase letter, one lowercase letter, one number and one special character",
                        authController.passwordSignup.value = '',
                      }
                  },
                ),
                SizedBox(height: heightSize(100)),
                ActionButton(
                  text: "Get Started",
                  callback: () {
                    Get.toNamed(Routes.MAIN_APP);
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
