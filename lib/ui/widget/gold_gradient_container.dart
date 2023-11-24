import 'package:flutter/material.dart';
import 'package:gru_chang/shared/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class GoldGradientContainer extends StatelessWidget {
  final Widget child;

  const GoldGradientContainer({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: goldGradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
