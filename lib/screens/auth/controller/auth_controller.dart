import "package:flutter/material.dart";
import "package:get/get.dart";

class AuthController extends GetxController {
  TextEditingController emailSignupController = TextEditingController();
  TextEditingController fullnameSignupController = TextEditingController();
  TextEditingController passwordSignupController = TextEditingController();
  TextEditingController emailSigninController = TextEditingController();
  TextEditingController passwordSigninController = TextEditingController();
  TextEditingController forgotPasswordController = TextEditingController();

  RxString emailSignup = RxString("");
  RxString fullnameSignup = RxString("");
  RxString passwordSignup = RxString("");
  RxString emailSignin = RxString("");
  RxString passwordSignin = RxString("");
  RxString forgotPassword = RxString("");

  RxString error = RxString("");
  RxBool load = RxBool(false);
}
