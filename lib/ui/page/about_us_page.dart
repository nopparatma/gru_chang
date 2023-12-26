import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/app/app_resource.dart';
import 'package:gru_chang/shared/theme.dart';
import 'package:gru_chang/ui/common_layout.dart';
import 'package:gru_chang/ui/router.dart';
import 'package:gru_chang/ui/widget/custom_read_more_widget.dart';
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
      header: (scrollController) => HeaderWidget(
        title: AppResource.aboutUs.tr(),
        fromPage: AppResource.home.tr(),
      ),
      name: AppResource.aboutUs.tr(),
      body: Column(
        children: [
          for (int i = 0; i < 10; i++)
            Column(
              children: [
                _buildControlWidget(i),
                const SizedBox(height: 50),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildControlWidget(int index) {
    Widget widgetLeft = _buildText();
    Widget widgetRight = _buildImage();

    if ((index % 2) != 0) {
      widgetLeft = _buildImage();
      widgetRight = _buildText();
    }

    return SizedBox(
      height: 300,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widgetLeft,
          const SizedBox(width: 50),
          widgetRight,
        ],
      ),
    );
  }

  Widget _buildText() {
    return Expanded(
      flex: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Contemporary Mission of “Royal Goldsmith”',
            style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 26),
          CustomReadMoreTextWidget(
            'Goldsmiths who could make ornament by ancient techniques were absolutely extinct. Our living goldsmith-cum-instructors specialize in gold jewellery making of only the last 3-4 decades. We simply don’t have any experts in the production techniques of gold ornaments of Ayutthaya and Early Rattanakosin period, not even the period during the reigns of King Rama 6 and 7, especially of gold jewellery belonged to the royal members which is distinctively beautiful and different from common gold jewellery” said Niphon Yodkumpun, one of the first generation of students from the Golden Jubilee Royal Goldsmith College. Ten years after graduation, he is now a Royal Goldsmith under the Bureau of the Royal Household; and as an alumnus, he has played an important role in supporting the college in training later generations of students.',
            trimLines: 5,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read more',
            moreStyle: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold),
            isExpand: false,
            callback: (val) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Show Dialog"),
              ));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Expanded(
      flex: 5,
      child: Image.asset(
        'assets/images/main_background.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
