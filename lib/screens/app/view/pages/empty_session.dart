import 'package:ai_duo/constants/assets_path.dart';
import 'package:ai_duo/constants/value.dart';
import 'package:ai_duo/shared/custom_text.dart';
import 'package:ai_duo/utils/colors.dart';
import 'package:ai_duo/utils/sizes.dart';
import 'package:flutter/material.dart';

class EmptySession extends StatefulWidget {
  const EmptySession({super.key});

  @override
  State<EmptySession> createState() => _EmptySessionState();
}

class _EmptySessionState extends State<EmptySession> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            //Image.asset(newsession),
            SizedBox(height: constraints.maxHeight * 0.15),
            Align(
              child: Container(
                height: heightSize(300),
                width: widthSize(300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Values().boxRadius),
                  image: DecorationImage(
                    image: AssetImage(newsession),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: heightSize(10)),
            const CText(
              text:
                  "You don't have an active session at the moment. To get started, simply click the button in the left sidebar.",
              textAlign: TextAlign.center,
              color: kTextTitleColor,
              size: 14,
            ),
            const Spacer(),
          ],
        );
      }),
    );
  }
}
