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

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      isShowBodyByScroll: false,
      menuRouteSelect: RoutePaths.contactUsPage,
      header: HeaderWidget(
        title: AppResource.contactUs.tr(),
        fromPage: AppResource.home.tr(),
      ),
      name: AppResource.contactUs.tr(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorDarkRed,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Booking Ancient Gold Form',
                    style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(height: 10),
                  _buildForm(),
                  _buildTextField(label: 'Query', hintText: 'Enter the information about which you wish to inquire', maxLine: 2),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Click ‘Submit’ to place order or send query.\nThank you and please visit us again.',
                      style: Theme.of(context).textTheme.normal,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  GoldGradientButtonWidget(text: 'Submit', style: Theme.of(context).textTheme.normal.copyWith(color: colorBlack))
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorDarkRed,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get In Touch',
                    style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(height: 10),
                  _buildIconText(Icons.home_work, 'The Old Siam Plaza, 2nd Floor, Zone Silk.'),
                  const SizedBox(height: 10),
                  _buildIconText(Icons.phone, '02-623-8409'),
                  const SizedBox(height: 10),
                  _buildIconText(Icons.phone, '083-718-8850'),
                  const SizedBox(height: 10),
                  _buildIconText(Icons.phone, '083-459-7773'),
                  const SizedBox(height: 20),
                  Text(
                    'Follow us',
                    style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(height: 10),
                  Text(
                    'Guru-Chang Antique Gold Jewelry. Some specimens. From the site may be depleted. Must be made in Order advance Please call the shop before. your like this product. Before you arrive at the branch. Central my thanks.',
                    style: Theme.of(context).textTheme.normal,
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    style: Theme.of(context).textTheme.normal.copyWith(color: Colors.red),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Note: ',
                          style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Guru-Chang Antique Gold Jewelry. The Old Siam Plaza. Only one branch! Not a dealer.',
                          style: Theme.of(context).textTheme.normal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              _buildTextField(label: 'Full Name', hintText: 'Enter your name-surname'),
              _buildTextField(label: 'Age', hintText: 'Enter your age'),
              _buildTextField(label: 'Mobile Number', hintText: 'Enter your mobile number'),
              _buildTextField(label: 'Jewelry Code', hintText: 'Select jewelry code'),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              _buildTextField(label: 'Email', hintText: 'Enter your email'),
              _buildTextField(label: 'Gender', hintText: 'Select your gender'),
              _buildTextField(label: 'Jewelry Type', hintText: 'Select jewelry type'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({required String label, required String hintText, int? maxLine}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.normal),
        const SizedBox(height: 5),
        CustomTextFieldWidget(hintText: hintText, maxLine: maxLine),
        const SizedBox(height: 20),
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
