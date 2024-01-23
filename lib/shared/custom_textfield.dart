import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:ai_duo/utils/sizes.dart';

class AuthTextField extends StatelessWidget {
  //final Function(String) validator;
  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  final String error;
  final String Function(String?) validFunction;
  final Function(String)? onSavedFunction;
  final Function(String)? onSubmitFunction;
  final Color? color;
  final Color? hintColor;
  final Color? fillColor;
  final bool? enabled;
  final double? height;
  final Icon? suffixIcon;
  final VoidCallback? tapCallback;
  final bool? obscureText;
  final bool? isPassword;

  const AuthTextField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.inputType,
    required this.error,
    required this.validFunction,
    this.onSavedFunction,
    this.color,
    this.onSubmitFunction,
    this.enabled = true,
    this.height,
    this.hintColor,
    this.fillColor,
    this.obscureText,
    this.suffixIcon,
    this.tapCallback,
    this.isPassword = false,

    //required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: heightSize(height ?? 65),
      width: size.width,
      decoration: BoxDecoration(
        color: color ?? kGreyColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Values().boxRadius),
      ),
      child: Align(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            validator: validFunction,
            onChanged: onSavedFunction,
            onFieldSubmitted: onSubmitFunction,
            keyboardType: inputType,
            showCursor: true,
            cursorColor: kPrimaryColor,
            obscureText: obscureText ?? false,
            //validator: validator,
            style: TextStyle(
              color: kWhiteColor,
              fontSize: fontSize(28),
              fontFamily: CFONT.BOLD,
            ),

            decoration: InputDecoration(
              suffixIcon: isPassword == true
                  ? GestureDetector(
                      onTap: tapCallback,
                      child: obscureText == true
                          ? const Icon(
                              Octicons.eye_closed,
                              color: kTextSubtitleColor,
                              size: 22,
                            )
                          : const Icon(
                              Octicons.eye,
                              color: kTextSubtitleColor,
                              size: 22,
                            ),
                    )
                  : const SizedBox.shrink(),
              hintText: hint,
              hintStyle: TextStyle(
                color: hintColor ?? kWhiteColor.withOpacity(0.4),
                fontSize: fontSize(28),
                fontFamily: CFONT.BOLD,
              ),

              // hintStyle: GoogleFonts.sansita(
              //   color: kWhite,
              // ),

              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
          
          ),
        ),
      ),
    );
  }
}

