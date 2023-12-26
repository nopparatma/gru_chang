import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gru_chang/shared/colors.dart';
import 'package:gru_chang/shared/theme.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'background_image_widget.dart';
import 'gold_gradient_button_widget.dart';
import 'gold_gradient_container_widget.dart';
import 'gold_gradient_text_widget.dart';

class BannerHomeWidget extends StatefulWidget {
  final AutoScrollController scrollController;

  const BannerHomeWidget({super.key, required this.scrollController});

  @override
  // ignore: library_private_types_in_public_api
  _BannerHomeWidgetState createState() => _BannerHomeWidgetState();
}

class _BannerHomeWidgetState extends State<BannerHomeWidget> {
  final presenterValues = [
    // 'assets/images/image_presenter2.png',
    'assets/images/image_presenter3.png',
    'assets/images/image_presenter4.png',
  ];
  int _index = 0;
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() => _index++);
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  _onTapBanner() {
    widget.scrollController.scrollToIndex(0, duration: const Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapBanner(),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return _buildDesktopView();
    }

    return _buildMobileView();
  }

  Widget _buildDesktopView() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.99 - 80,
      child: Stack(
        children: [
          const BackgroundImageWidget(isUseGradient: true),
          _buildDesktopViewPresenter(),
          _buildFooterBannerShadow(),
          _buildDesktopViewBannerContent(),
          Positioned.fill(
            child: Container(color: Colors.transparent),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileView() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.99 - 80,
      child: Stack(
        children: [
          const BackgroundImageWidget(isUseGradient: true),
          _buildMobileViewBannerContent(),
          _buildFooterBannerShadow(),
        ],
      ),
    );
  }

  Widget _buildFooterBannerShadow() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              for (int i = 0; i < 5; i++) colorBackground.withOpacity(0.1),
              colorBackground,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopViewBannerContent() {
    return Positioned.fill(
      child: Row(
        children: [
          const Expanded(flex: 1, child: Offstage()),
          Expanded(
            flex: 11,
            child: Column(
              children: [
                const Expanded(flex: 3, child: Offstage()),
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GoldGradientTextWidget(
                            text: 'Guru-Chang Antique',
                            style: Theme.of(context).textTheme.xExtraLarger,
                          ),
                          GoldGradientTextWidget(
                            text: 'Gold Jewelry',
                            style: Theme.of(context).textTheme.xExtraLarger,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'The Perfect Jewelry for you',
                            style: Theme.of(context).textTheme.normal,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 200,
                            child: GoldGradientButtonWidget(
                              text: 'Explore More',
                              style: Theme.of(context).textTheme.normal.copyWith(color: colorBlack),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _buildPhoneNumberSection(phoneNumber: '083-718-8850'),
                          const SizedBox(width: 20),
                          _buildPhoneNumberSection(phoneNumber: '083-459-7773'),
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(flex: 1, child: Offstage()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileViewBannerContent() {
    return Positioned.fill(
      child: Row(
        children: [
          const Expanded(flex: 1, child: Offstage()),
          Expanded(
            flex: 10,
            child: Column(
              children: [
                const Expanded(flex: 1, child: Offstage()),
                Expanded(
                  flex: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GoldGradientTextWidget(
                        text: 'Guru-Chang Antique',
                        style: Theme.of(context).textTheme.xLarger,
                      ),
                      GoldGradientTextWidget(
                        text: 'Gold Jewelry',
                        style: Theme.of(context).textTheme.xLarger,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'The Perfect Jewelry for you',
                        style: Theme.of(context).textTheme.normal,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 200,
                        child: GoldGradientButtonWidget(
                          text: 'Explore More',
                          style: Theme.of(context).textTheme.normal.copyWith(color: colorBlack),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildPhoneNumberSection(phoneNumber: '083-718-8850'),
                          const SizedBox(width: 10),
                          _buildPhoneNumberSection(phoneNumber: '083-459-7773'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildMobileViewPresenter(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: Offstage()),
        ],
      ),
    );
  }

  Widget _buildDesktopViewPresenter() {
    return Positioned.fill(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 11,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 2000),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (Widget image, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: image,
                );
              },
              child: Align(
                key: UniqueKey(),
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  presenterValues[_index % presenterValues.length],
                ),
              ),
            ),
          ),
          const Expanded(flex: 1, child: Offstage()),
        ],
      ),
    );
  }

  Widget _buildMobileViewPresenter() {
    return Expanded(
      // height: MediaQuery.of(context).size.height * 0.3,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 2000),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (Widget image, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: image,
          );
        },
        child: Align(
          key: UniqueKey(),
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            presenterValues[_index % presenterValues.length],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberSection({required String phoneNumber}) {
    return Row(
      children: [
        const GoldGradientContainerWidget(
          child: Icon(
            Icons.phone,
            color: colorBlack,
            size: 20,
          ),
        ),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: GoldGradientTextWidget(
            text: phoneNumber,
            style: Theme.of(context).textTheme.normal,
          ),
        ),
      ],
    );
  }
}
