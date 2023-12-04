import 'package:flutter/material.dart';
import 'package:gru_chang/shared/colors.dart';
import 'package:gru_chang/ui/widget/gold_gradient_container_widget.dart';
import 'package:gru_chang/utils/dialog_util.dart';
import 'package:photo_view/photo_view.dart';

class GoldGradientButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle style;

  const GoldGradientButtonWidget({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GoldGradientContainerWidget(
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
              onPressed: () {
                DialogUtil.showCustomDialog(
                  context,
                  backgroundColor: colorBackground,
                  barrierDismissible: true,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height > MediaQuery.of(context).size.width ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.height > MediaQuery.of(context).size.width ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.height * 0.8,
                    child: PhotoView(
                      backgroundDecoration: const BoxDecoration(color: Colors.transparent),
                      imageProvider: const AssetImage('assets/images/p3.jpeg'),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
