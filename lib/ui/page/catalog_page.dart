import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/app/app_resource.dart';
import 'package:gru_chang/ui/router.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppResource.catalog.tr()),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'TEST1',
            onPressed: () {
              setState(() {
                // LanguageUtil.changeLanguage(context);
              });
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'TEST2',
            onPressed: () {
              Navigator.pushReplacementNamed(context, RoutePaths.homePage);
            },
          ),
        ],
      ),
    );
  }
}
