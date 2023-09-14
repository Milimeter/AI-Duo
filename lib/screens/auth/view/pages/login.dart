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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.find();
  bool obscureText = true;
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
                AuthTextField(
                  hint: "Email Address",
                  controller: authController.emailSigninController,
                  error: authController.error.value,
                  inputType: TextInputType.emailAddress,
                  validFunction: (v) => v!,
                  onSavedFunction: (s) => {
                    if (s.isValidEmail())
                      {
                        authController.error.value = '',
                        authController.emailSignin.value = s,
                        //print(email);
                      }
                    else
                      {
                        authController.error.value = "Invalid email address",
                        authController.emailSignin.value = '',
                      }
                  },
                ),
                SizedBox(height: heightSize(20)),
                AuthTextField(
                  hint: "Password",
                  controller: authController.passwordSigninController,
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
                        authController.passwordSignin.value = s,
                        //print(email);
                      }
                    else
                      {
                        authController.error.value =
                            "Password must be minimum of eight characters, at least one uppercase letter, one lowercase letter, one number and one special character",
                        authController.passwordSignin.value = '',
                      }
                  },
                ),
                SizedBox(height: heightSize(20)),
                const CText(
                  text: "Forgot Password?",
                ),
                SizedBox(height: heightSize(100)),
                ActionButton(
                  text: "Continue",
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
