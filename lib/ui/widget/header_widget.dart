import 'package:flutter/material.dart';
import 'package:gru_chang/shared/theme.dart';

import 'background_image_widget.dart';
import 'gold_gradient_text_widget.dart';

class HeaderWidget extends StatefulWidget {
  final String title;
  final String fromPage;

  const HeaderWidget({
    super.key,
    required this.title,
    required this.fromPage,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          const BackgroundImageWidget(isUseGradient: false),
          _buildHeaderContent(),
        ],
      ),
    );
  }

  Widget _buildHeaderContent() {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GoldGradientTextWidget(
            text: widget.title,
            style: Theme.of(context).textTheme.xxxLarger,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.fromPage,
                style: Theme.of(context).textTheme.normal,
              ),
              const SizedBox(width: 10),
              Text(
                '>',
                style: Theme.of(context).textTheme.normal,
              ),
              const SizedBox(width: 10),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
