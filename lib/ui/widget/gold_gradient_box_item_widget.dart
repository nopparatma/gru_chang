import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gru_chang/shared/colors.dart';
import 'package:gru_chang/shared/theme.dart';
import 'package:gru_chang/ui/widget/gold_gradient_button_widget.dart';

class GoldGradientBoxItemWidget extends StatelessWidget {
  const GoldGradientBoxItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 400;
    const double productCodeHeight = 50;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(bottom: productCodeHeight / 2),
              child: Container(
                decoration: BoxDecoration(
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: goldGradientColors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/p3.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: productCodeHeight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GoldGradientButtonWidget(
                          text: 'Product Code: PO-101',
                          style: Theme.of(context).textTheme.normal.copyWith(
                                color: colorNormalText,
                            fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
