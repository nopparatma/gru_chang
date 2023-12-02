import 'package:flutter/material.dart';
import 'package:gru_chang/shared/theme.dart';

import 'gold_gradient_text_widget.dart';

class MainContentWidget extends StatefulWidget {
  final String title;
  final Widget content;

  const MainContentWidget({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MainContentWidgetState createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildMainContent();
  }

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GoldGradientTextWidget(
            text: widget.title,
            style: Theme.of(context).textTheme.xxLarger,
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              const Expanded(flex: 1, child: Offstage()),
              Expanded(
                flex: 10,
                child: widget.content,
              ),
              const Expanded(flex: 1, child: Offstage()),
            ],
          ),
        ],
      ),
    );
  }
}
