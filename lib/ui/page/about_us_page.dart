import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/app/app_resource.dart';
import 'package:gru_chang/shared/colors.dart';
import 'package:gru_chang/shared/theme.dart';
import 'package:gru_chang/ui/common_layout.dart';
import 'package:gru_chang/ui/router.dart';
import 'package:gru_chang/ui/widget/custom_text_field_widget.dart';
import 'package:gru_chang/ui/widget/gold_gradient_button_widget.dart';
import 'package:gru_chang/ui/widget/header_widget.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      isShowBodyByScroll: false,
      menuRouteSelect: RoutePaths.aboutUsPage,
      header: HeaderWidget(
        title: AppResource.aboutUs.tr(),
        fromPage: AppResource.home.tr(),
      ),
      name: AppResource.aboutUs.tr(),
      body: Container(),
    );
  }
}
