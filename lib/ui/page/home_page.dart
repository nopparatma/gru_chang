import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/shared/colors.dart';
import 'package:gru_chang/shared/theme.dart';
import 'package:gru_chang/ui/widget/gold_gradient_button.dart';
import 'package:gru_chang/ui/widget/gold_gradient_container.dart';
import 'package:gru_chang/ui/widget/gold_gradient_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = [
    'English',
    'ไทย',
  ];
  late String? selectedValue;

  @override
  void initState() {
    selectedValue = items[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    _buildMainMenuBar(),
                    _buildBanner(),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
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
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 14),
                                  const Icon(
                                    Icons.language,
                                    size: 18,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(
                                        item,
                                        style: Theme.of(context).textTheme.small,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.all(0)
                    ),
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
    );
  }

  Widget _buildMenus() {
    List<String> listMenus = [
      'Home',
      'Antique',
      'About Us',
      'Contact Us',
    ];

    List<Widget> listWidgets = [];
    for (String item in listMenus) {
      listWidgets.addAll([
        Text(item, style: Theme.of(context).textTheme.small),
        const SizedBox(width: 30),
      ]);
    }

    return Row(
      children: listWidgets,
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      height: 480,
      child: Stack(
        children: [
          _buildBannerBackground(),
          _buildBannerContent(),
        ],
      ),
    );
  }

  Widget _buildBannerBackground() {
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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorBackground,
                  Colors.black54,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBannerContent() {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.only(top: 80, left: 60, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GoldGradientText(
                  text: 'GruChang Thai Gold Smith',
                  style: Theme.of(context).textTheme.xxlarger,
                ),
                GoldGradientText(
                  text: 'Gold Jewelry',
                  style: Theme.of(context).textTheme.xxlarger,
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
    );
  }

  Widget _buildPhoneNumberSection({required String phoneNumber}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
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
}
