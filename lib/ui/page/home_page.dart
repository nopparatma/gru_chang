import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/app/app_resource.dart';
import 'package:gru_chang/ui/common_layout.dart';
import 'package:gru_chang/ui/router.dart';
import 'package:gru_chang/ui/widget/gold_gradient_box_item_widget.dart';
import 'package:gru_chang/ui/widget/banner_home_widget.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)) {
          return Container(
            color: Colors.green,
          );
        }

        return CommonLayout(
          isShowBodyByScroll: true,
          menuRouteSelect: RoutePaths.homePage,
          header: const BannerHomeWidget(),
          name: AppResource.catalog.tr(),
          body: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 50,
            crossAxisSpacing: 50,
            children: const [
              GoldGradientBoxItemWidget(),
              GoldGradientBoxItemWidget(),
              GoldGradientBoxItemWidget(),
              GoldGradientBoxItemWidget(),
              GoldGradientBoxItemWidget(),
              GoldGradientBoxItemWidget(),
            ],
          ),
        );
      },
    );
  }
}
