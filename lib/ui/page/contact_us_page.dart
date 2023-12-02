import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:gru_chang/app/app_resource.dart';
import 'package:gru_chang/shared/colors.dart';
import 'package:gru_chang/shared/theme.dart';
import 'package:gru_chang/ui/common_layout.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
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
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    childAspectRatio: 3.5,
                    children: [
                      _buildTextField(label: 'Full Name', hintText: 'Enter your name'),
                      _buildTextField(label: 'Email', hintText: 'Email'),
                      _buildTextField(label: 'Age', hintText: 'Age'),
                      _buildTextField(label: 'Gender', hintText: 'Gender'),
                      _buildTextField(label: 'Phone Number', hintText: 'Phone Number'),
                      _buildTextField(label: 'Jewelry Type', hintText: 'Jewelry Type'),
                      _buildTextField(label: 'Jewelry Code', hintText: 'Jewelry Code'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(label: 'Query', hintText: 'Query'),
                  const SizedBox(height: 20),
                  Text('Click ‘Submit’ to place order or send query. Thank you and please visit us again.', style: Theme.of(context).textTheme.small),
                  const SizedBox(height: 40),
                  GoldGradientButtonWidget(text: 'Submit', style: Theme.of(context).textTheme.small.copyWith(color: colorBlack))
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
                  _buildIconText(Icons.home_work, 'The Old Siam Plaza, 2nd Floor, Zone Silk.'),
                  const SizedBox(height: 10),
                  _buildIconText(Icons.phone, '02-623-8409'),
                  const SizedBox(height: 10),
                  _buildIconText(Icons.phone, '083-718-8850'),
                  const SizedBox(height: 10),
                  _buildIconText(Icons.phone, '083-459-7773'),
                  const SizedBox(height: 10),
                  Text(
                    'Follow us',
                    style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 1),
                  Text(
                    'Guru-Chang Antique Gold Jewelry. Some specimens. From the site may be depleted. Must be made in Order advance Please call the shop before. your like this product. Before you arrive at the branch. Central my thanks.',
                    style: Theme.of(context).textTheme.small,
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    style: Theme.of(context).textTheme.small.copyWith(color: Colors.red),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Note: ',
                          style: Theme.of(context).textTheme.small.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Guru-Chang Antique Gold Jewelry. The Old Siam Plaza. Only one branch! Not a dealer.',
                          style: Theme.of(context).textTheme.small,
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

  Widget _buildTextField({required String label, required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.small),
        const SizedBox(height: 5),
        CustomTextFieldWidget(hintText: hintText),
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
            style: Theme.of(context).textTheme.small,
          ),
        ),
      ],
    );
  }
}
