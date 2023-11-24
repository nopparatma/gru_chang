import 'package:flutter/material.dart';
import 'package:gru_chang/ui/widget/gold_gradient_container.dart';

class GoldGradientButton extends StatelessWidget {
  final String text;
  final TextStyle style;

  const GoldGradientButton({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GoldGradientContainer(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          textStyle: style,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
        onPressed: () {},
      ),
    );
  }
}
