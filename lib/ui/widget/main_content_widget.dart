import 'package:flutter/material.dart';
import 'package:gru_chang/shared/theme.dart';

import 'gold_gradient_text_widget.dart';

class MainContentWidget extends StatefulWidget {
  final String title;
  final Widget content;
  final ScrollController scrollController;
  final bool isShowBodyByScroll;

  const MainContentWidget({
    required this.title,
    required this.content,
    required this.scrollController,
    required this.isShowBodyByScroll,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MainContentWidgetState createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  late double pixels = 0.0;

  @override
  void initState() {
    widget.scrollController.addListener(() {
      setState(() {
        pixels = widget.scrollController.position.pixels;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: pixels >= (widget.isShowBodyByScroll ? 100 : 0) ? 1.0 : 0.0,
      duration: const Duration(seconds: 3),
      curve: Curves.fastOutSlowIn,
      child: _buildMainContent(),
    );
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
