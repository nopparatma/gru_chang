import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/app/app_constant.dart';
import 'package:gru_chang/app/app_resource.dart';
import 'package:gru_chang/shared/theme.dart';
import 'package:gru_chang/utils/language_util.dart';

class MenuTopBarWidget extends StatefulWidget {
  const MenuTopBarWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuTopBarWidgetState createState() => _MenuTopBarWidgetState();
}

class _MenuTopBarWidgetState extends State<MenuTopBarWidget> {
  final List<Map<String, String>> languageItems = [
    {'value': 'th', 'name': 'ไทย', 'icon': 'assets/images/icon_thai.png'},
    {'value': 'en', 'name': 'English', 'icon': 'assets/images/icon_english.png'},
  ];

  List<String> listMenus = [
    AppResource.home,
    AppResource.antique,
    AppResource.aboutUs,
    AppResource.contactUs,
  ];

  late String? selectedLanguageValue;
  late List<Widget> listMenuWidgets = [];

  @override
  void initState() {
    selectedLanguageValue = languageItems.first['value'];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Locale? currentLocale = EasyLocalization.of(context)?.currentLocale;
      selectedLanguageValue = currentLocale?.languageCode;
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainMenuBar();
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
                                      const SizedBox(width: 18),
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
}
