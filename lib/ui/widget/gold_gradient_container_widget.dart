import 'package:flutter/material.dart';
import 'package:gru_chang/shared/colors.dart';

class GoldGradientContainerWidget extends StatelessWidget {
  final Widget child;

  const GoldGradientContainerWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: colorGoldGradients,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
