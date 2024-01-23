import 'package:ai_duo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final String loadingText;

  LoadingOverlay({required this.isLoading, required this.loadingText});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            color: Colors.black.withOpacity(0.6), // Semi-transparent background
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  LoadingAnimationWidget.discreteCircle(
                    color: kPrimaryColor,
                    secondRingColor: kSecondaryColor,
                    size: 60,
                  ),
                  SizedBox(height: 16),
                  Text(
                    loadingText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox.shrink(); // An empty, invisible widget when not loading
  }
}
