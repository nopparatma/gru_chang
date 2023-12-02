import 'package:flutter/material.dart';
import 'package:gru_chang/shared/colors.dart';

class BackgroundImageWidget extends StatelessWidget {
  final bool isUseGradient;

  const BackgroundImageWidget({
    required this.isUseGradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = BoxDecoration(
      color: colorBackground.withOpacity(0.8),
    );

    if (isUseGradient) {
      boxDecoration = BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorBackground,
            colorBackground.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );
    }

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/main_background.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: boxDecoration,
          ),
        ),
      ],
    );
  }
}
