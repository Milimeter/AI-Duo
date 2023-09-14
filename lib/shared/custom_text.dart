import 'package:flutter/material.dart';
import 'package:freckled_zelda/constants/font_family.dart';
import 'package:freckled_zelda/utils/colors.dart';
import 'package:freckled_zelda/utils/sizes.dart';

class CText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final VoidCallback? onClick;
  final String? fontFamily;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final double? height;
  final bool? allowOverflow;
  final FontStyle? fontStyle;
  const CText({
    Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
    this.onClick,
    this.fontFamily,
    this.letterSpacing,
    this.textAlign,
    this.height,
    this.allowOverflow = false,
    this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: onClick == null
          ? Text(
              text,
              textAlign: textAlign ?? TextAlign.start,
              overflow: allowOverflow == false ? null : TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize(size ?? 26),
                fontWeight: fontWeight ?? FontWeight.w400,
                fontFamily: fontFamily ?? CFontFamily.DongleLight,
                color: color ?? kWhiteColor.withOpacity(0.8), //Colors.grey
                wordSpacing: wordSpacing,
                letterSpacing: letterSpacing ?? 0,
                height: height ?? 1,
                fontStyle: fontStyle ?? FontStyle.normal,
              ),
            )
          : TextButton(
              onPressed: () => onClick?.call(),
              child: Text(
                text,
                textAlign: textAlign ?? TextAlign.start,
                overflow: allowOverflow == false ? null : TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize(size ?? 26),
                  fontWeight: fontWeight ?? FontWeight.w400,
                  fontFamily: fontFamily ?? CFontFamily.DongleLight,
                  color: color ?? kWhiteColor.withOpacity(0.8), //Colors.grey
                  wordSpacing: wordSpacing,
                  letterSpacing: letterSpacing ?? 0,
                  height: height ?? 1,
                  fontStyle: fontStyle ?? FontStyle.normal,
                ),
              ),
            ),
    );
  }
}
