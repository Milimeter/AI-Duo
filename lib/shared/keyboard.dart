

import 'package:flutter/material.dart';
import 'package:freckled_zelda/constants/font_family.dart';
import 'package:freckled_zelda/shared/custom_text.dart';
import 'package:freckled_zelda/utils/sizes.dart';



typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Icon? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Icon? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  const NumericKeyboard(
      {Key? key,
      required this.onKeyboardTap,
      this.textColor = Colors.black,
      this.rightButtonFn,
      this.rightIcon,
      this.leftButtonFn,
      this.leftIcon,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              widget.rightIcon == null
                  ? _calcButton('.')
                  : InkWell(
                      borderRadius: BorderRadius.circular(45),
                      onTap: widget.leftButtonFn,
                      child: Container(
                          alignment: Alignment.center,
                          width: widthSize(90),
                          height: heightSize(70),
                          //  decoration: BoxDecoration(
                          //   color: kTextSubtitleColor.withOpacity(0.1),
                          //   borderRadius:
                          //       BorderRadius.circular(Values().boxRadius),
                          // ),
                          child: widget.leftIcon)),
              _calcButton('0'),
              widget.rightIcon == null
                  ? _calcButton('.')
                  : InkWell(
                      borderRadius: BorderRadius.circular(45),
                      onTap: widget.rightButtonFn,
                      child: Container(
                          alignment: Alignment.center,
                          width: widthSize(90),
                          height: heightSize(70),
                          // decoration: BoxDecoration(
                          //   color: kGreyColor.withOpacity(0.3),
                          //   borderRadius:
                          //       BorderRadius.circular(Values().boxRadius),
                          // ),
                          child: widget.rightIcon))
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: Container(
          alignment: Alignment.center,
          width: widthSize(90),
          height: heightSize(70),
          // decoration: BoxDecoration(
          //   color: kTextSubtitleColor.withOpacity(0.1),
          //   borderRadius: BorderRadius.circular(Values().boxRadius),
          // ),
          child: CText(
            text: value,
            size: 26,
            fontWeight: FontWeight.w400,
            fontFamily: CFontFamily.DongleRegular,
            color: widget.textColor,
          ),
        ));
  }
}
