import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/app/app_constant.dart';
import 'package:gru_chang/app/app_resource.dart';
import 'package:gru_chang/shared/theme.dart';
import 'package:gru_chang/ui/router.dart';
import 'package:gru_chang/utils/dialog_util.dart';
import 'package:gru_chang/utils/language_util.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'gold_gradient_text_widget.dart';

class MenuTopBarWidget extends StatefulWidget {
  final String menuRouteSelect;

  const MenuTopBarWidget({super.key, required this.menuRouteSelect});

  @override
  // ignore: library_private_types_in_public_api
  _MenuTopBarWidgetState createState() => _MenuTopBarWidgetState();
}

class _MenuTopBarWidgetState extends State<MenuTopBarWidget> {
  final List<Map<String, String>> languageItems = [
    {'value': 'th', 'name': 'ไทย', 'icon': 'assets/images/icon_thai.png'},
    {'value': 'en', 'name': 'English', 'icon': 'assets/images/icon_english.png'},
  ];
  late Map<String, String> menuSelected;

  List<Map<String, String>> listMenus = [
    {'name': AppResource.home, 'route': RoutePaths.homePage},
    {'name': AppResource.antique, 'route': RoutePaths.catalogPage},
    {'name': AppResource.aboutUs, 'route': RoutePaths.aboutUsPage},
    {'name': AppResource.contactUs, 'route': RoutePaths.contactUsPage},
  ];

  late String? selectedLanguageValue;
  late List<Widget> listMenuWidgets = [];

  @override
  void initState() {
    menuSelected = listMenus.firstWhere((a) => a['route'] == widget.menuRouteSelect, orElse: () => listMenus.first);

    selectedLanguageValue = languageItems.first['value'];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        Locale? currentLocale = EasyLocalization.of(context)?.currentLocale;
        selectedLanguageValue = currentLocale?.languageCode;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return _buildDesktopView();
    }

    return _buildMobileView();
  }

  Widget _buildDesktopView() {
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
                    _buildDesktopMenus(),
                    const SizedBox(width: 30),
                    _buildLanguageDropdown(),
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

  Widget _buildMobileView() {
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
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Image.asset(
                    'assets/images/logo_gru_chang_no_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    DialogUtil.showBottomSheet(
                      context,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Menu', style: Theme.of(context).textTheme.large.copyWith(fontWeight: FontWeight.bold)),
                          const Divider(thickness: 0.2),
                          const SizedBox(height: 10),
                          _buildMobileMenus(),
                          const SizedBox(height: 30),
                          Text('Setting', style: Theme.of(context).textTheme.large.copyWith(fontWeight: FontWeight.bold)),
                          const Divider(thickness: 0.2),
                          const SizedBox(height: 10),
                          _buildLanguageDropdown(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: Offstage()),
        ],
      ),
    );
  }

  Widget _buildDesktopMenus() {
    List<Widget> listWidgets = [];
    for (Map<String, String> item in listMenus) {
      listWidgets.addAll([
        InkWell(
          child: _buildText(item),
          onTap: () {
            setState(() {
              menuSelected = item;
              Navigator.pushNamed(context, menuSelected['route'] ?? AppConstant.emptyString);
            });
          },
        ),
        const SizedBox(width: 30),
      ]);
    }

    return Row(
      children: listWidgets,
    );
  }

  Widget _buildMobileMenus() {
    List<Widget> listWidgets = [];
    for (Map<String, String> item in listMenus) {
      listWidgets.addAll([
        InkWell(
          child: _buildText(item),
          onTap: () {
            setState(() {
              menuSelected = item;
              Navigator.pushNamed(context, menuSelected['route'] ?? AppConstant.emptyString);
            });
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Divider(thickness: 0.2),
        ),
      ]);
    }

    return Column(
      children: listWidgets,
    );
  }

  Widget _buildLanguageDropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        isDense: true,
        buttonStyleData: const ButtonStyleData(
          width: 130,
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
                      const SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          item['name'] ?? AppConstant.emptyString,
                          style: Theme.of(context).textTheme.normal,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        value: selectedLanguageValue,
        onChanged: (value) {
          if (!ResponsiveBreakpoints.of(context).isDesktop) {
            Navigator.of(context).pop();
          }

          setState(() {
            selectedLanguageValue = value;
            LanguageUtil.changeLanguage(context, selectedLanguageValue);
          });
        },
      ),
    );
  }

  Widget _buildText(Map<String, String> item) {
    if (item['name'] == menuSelected['name']) {
      return GoldGradientTextWidget(
        text: item['name']?.tr() ?? AppConstant.emptyString,
        style: Theme.of(context).textTheme.normal,
      );
    }

    return Text(item['name']?.tr() ?? AppConstant.emptyString, style: Theme.of(context).textTheme.normal);
  }
}
