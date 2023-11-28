import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/app/app_constant.dart';
import 'package:gru_chang/app/app_resource.dart';
import 'package:gru_chang/shared/colors.dart';
import 'package:gru_chang/shared/theme.dart';
import 'package:gru_chang/ui/widget/gold_gradient_box_item.dart';
import 'package:gru_chang/ui/widget/gold_gradient_button.dart';
import 'package:gru_chang/ui/widget/gold_gradient_container.dart';
import 'package:gru_chang/ui/widget/gold_gradient_text.dart';
import 'package:gru_chang/utils/language_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> languageItems = [
    {'value': 'th', 'name': 'ไทย', 'icon': 'assets/images/icon_thai.png'},
    {'value': 'en', 'name': 'English', 'icon': 'assets/images/icon_english.png'},
  ];

  List<String> listMenus = [
    AppResource.home,
    'Antique',
    'About Us',
    'Contact Us',
  ];

  late final Timer timer;

  final presenterValues = [
    'assets/images/image_presenter2.png',
    'assets/images/image_presenter3.png',
    'assets/images/image_presenter4.png',
  ];
  int _index = 0;

  late String? selectedLanguageValue;
  late List<Widget> listMenuWidgets = [];

  @override
  void initState() {
    selectedLanguageValue = languageItems.first['value'];

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() => _index++);
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Locale? currentLocale = EasyLocalization.of(context)?.currentLocale;
      selectedLanguageValue = currentLocale?.languageCode;
    });

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
                Column(
                  children: [
                    _buildMainMenuBar(),
                    _buildBanner(),
                    _buildMainContent(),
                    _buildFooter(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainMenuBar() {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          const Expanded(flex: 1, child: Offstage()),
          Expanded(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    'assets/images/logo_gru_chang_no_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    _buildMenus(),
                    const SizedBox(width: 30),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        isDense: true,
                        items: languageItems
                            .map((item) => DropdownMenuItem<String>(
                                  value: item['value'],
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 14),
                                      Image.asset(
                                        item['icon'] ?? AppConstant.emptyString,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          item['name'] ?? AppConstant.emptyString,
                                          style: Theme.of(context).textTheme.small,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                        value: selectedLanguageValue,
                        onChanged: (value) {
                          setState(() {
                            selectedLanguageValue = value;
                            LanguageUtil.changeLanguage(context, selectedLanguageValue);
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.all(0)),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                          ),
                          iconSize: 20,
                          iconEnabledColor: Colors.yellow,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: Offstage()),
        ],
      ),
    );
  }

  Widget _buildMenus() {
    List<Widget> listWidgets = [];
    for (String item in listMenus) {
      listWidgets.addAll([
        Text(item.tr(), style: Theme.of(context).textTheme.small),
        const SizedBox(width: 30),
      ]);
    }

    return Row(
      children: listWidgets,
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      height: 700,
      child: Stack(
        children: [
          _buildBackgroundImage(isUseGradient: true),
          _buildBannerContent(),
          _buildPresenter(),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage({required bool isUseGradient}) {
    BoxDecoration boxDecoration = BoxDecoration(
      color: colorBackground.withOpacity(0.8),
    );

    if (isUseGradient) {
      boxDecoration = BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorBackground,
            colorBackground.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );
    }

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/main_background.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: boxDecoration,
          ),
        ),
      ],
    );
  }

  Widget _buildBannerContent() {
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
                          GoldGradientText(
                            text: 'Guru-Chang Antique',
                            style: Theme.of(context).textTheme.xExtraLarger,
                          ),
                          GoldGradientText(
                            text: 'Gold Jewelry',
                            style: Theme.of(context).textTheme.xExtraLarger,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'The Perfect Jewelry for you',
                            style: Theme.of(context).textTheme.normal,
                          ),
                          const SizedBox(height: 20),
                          GoldGradientButton(
                            text: 'Explore More',
                            style: Theme.of(context).textTheme.normal.copyWith(
                                  color: colorNormalText,
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

  Widget _buildPresenter() {
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

  Widget _buildPhoneNumberSection({required String phoneNumber}) {
    return Row(
      children: [
        const GoldGradientContainer(
          child: Icon(
            Icons.phone,
            color: colorNormalText,
            size: 20,
          ),
        ),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: GoldGradientText(
            text: phoneNumber,
            style: Theme.of(context).textTheme.normal,
          ),
        ),
      ],
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
          _buildBackgroundImage(isUseGradient: false),
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
