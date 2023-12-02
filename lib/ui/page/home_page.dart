import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/app/app_resource.dart';
import 'package:gru_chang/shared/theme.dart';
import 'package:gru_chang/ui/widget/background_image_widget.dart';
import 'package:gru_chang/ui/widget/gold_gradient_box_item.dart';
import 'package:gru_chang/ui/widget/gold_gradient_text.dart';
import 'package:gru_chang/ui/widget/banner_home_widget.dart';
import 'package:gru_chang/ui/widget/menu_top_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> listMenuWidgets = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                const MenuTopBarWidget(),
                const BannerHomeWidget(),
                _buildMainContent(),
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          GoldGradientText(
            text: AppResource.catalog.tr(),
            style: Theme.of(context).textTheme.xxLarger,
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              const Expanded(flex: 1, child: Offstage()),
              Expanded(
                flex: 10,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 50,
                  children: const [
                    GoldGradientBoxItem(),
                    GoldGradientBoxItem(),
                    GoldGradientBoxItem(),
                    GoldGradientBoxItem(),
                    GoldGradientBoxItem(),
                    GoldGradientBoxItem(),
                  ],
                ),
              ),
              const Expanded(flex: 1, child: Offstage()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          const BackgroundImageWidget(isUseGradient: false),
          _buildFooterContent(),
        ],
      ),
    );
  }

  Widget _buildFooterContent() {
    Widget spacing = const Expanded(flex: 1, child: Offstage());

    return Row(
      children: [
        spacing,
        Expanded(
          flex: 10,
          child: Column(
            children: [
              spacing,
              Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/images/logo_gru_chang_no_bg.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text('Guru-Chang Antique', style: Theme.of(context).textTheme.normal),
                          const SizedBox(height: 10),
                          _buildIconText(Icons.home_work, 'The Old Siam Plaza, 2nd Floor, Zone Silk.'),
                          const SizedBox(height: 10),
                          _buildIconText(Icons.phone, '083-718-8850'),
                          const SizedBox(height: 10),
                          _buildIconText(Icons.phone, '083-459-7773'),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    spacing,
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: listMenuWidgets,
                            ),
                          ),
                        ],
                      ),
                    ),
                    spacing,
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: listMenuWidgets,
                            ),
                          ),
                        ],
                      ),
                    ),
                    spacing,
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: listMenuWidgets,
                            ),
                          ),
                        ],
                      ),
                    ),
                    spacing,
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: listMenuWidgets,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Divider(thickness: 0.2),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Copyright 2023 GruChangThaiGoldSmith.Com',
                            style: Theme.of(context).textTheme.smaller.copyWith(color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Image.asset('assets/images/icon_facebook.png'),
                                const SizedBox(width: 15),
                                Image.asset('assets/images/icon_line.png'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        spacing,
      ],
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.yellow,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.normal,
          ),
        ),
      ],
    );
  }
}
