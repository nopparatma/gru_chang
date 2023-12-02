import 'package:flutter/material.dart';
import 'package:gru_chang/shared/theme.dart';
import 'package:gru_chang/ui/widget/background_image_widget.dart';
import 'package:gru_chang/ui/widget/main_content_widget.dart';
import 'package:gru_chang/ui/widget/menu_top_bar_widget.dart';

class CommonLayout extends StatefulWidget {
  final Widget header;
  final String name;
  final Widget body;

  const CommonLayout({
    required this.header,
    required this.name,
    required this.body,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CommonLayoutState createState() => _CommonLayoutState();
}

class _CommonLayoutState extends State<CommonLayout> {
  late List<Widget> listMenuWidgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                const MenuTopBarWidget(),
                widget.header,
                MainContentWidget(
                  title: widget.name,
                  content: widget.body,
                ),
                _buildFooter(),
              ],
            ),
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
