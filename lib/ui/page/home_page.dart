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
  List<Widget> listWidgets = const [
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CommonLayout(
          isShowBodyByScroll: true,
          menuRouteSelect: RoutePaths.homePage,
          header: (scrollController) => BannerHomeWidget(scrollController: scrollController),
          name: AppResource.catalog.tr(),
          body: _buildContent(),
        );
      },
    );
  }

  Widget _buildContent() {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return _buildDesktopView();
    }

    return _buildMobileView();
  }

  Widget _buildDesktopView() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 50,
      crossAxisSpacing: 50,
      children: listWidgets,
    );
  }

  Widget _buildMobileView() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 1,
      mainAxisSpacing: 25,
      crossAxisSpacing: 25,
      children: listWidgets,
    );
  }
}
