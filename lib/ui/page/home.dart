import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/app/app_string.dart';
import 'package:gru_chang/utils/locale_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppString.homePage.tr()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            LocaleUtil.changeLanguage(context);
          });
        },
      ),
    );
  }
}
