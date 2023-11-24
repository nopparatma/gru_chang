import 'package:flutter/material.dart';
import 'package:gru_chang/shared/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class GoldGradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final GradientType gradientType;

  const GoldGradientText({
    required this.text,
    required this.style,
    this.gradientType = GradientType.linear,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      style: style,
      textAlign: TextAlign.center,
      gradientType: gradientType,
      gradientDirection: GradientDirection.ltr,
      colors: goldGradientColors,
    );
  }
}
