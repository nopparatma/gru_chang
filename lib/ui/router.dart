import 'package:flutter/material.dart';
import 'package:gru_chang/ui/page/catalog_page.dart';
import 'package:gru_chang/ui/page/home_page.dart';

class RoutePaths {
  static const String index = '/';
  static const String homePage = '/home_page';
  static const String catalogPage = '/catalog_page';
  static const String aboutUsPage = '/about_us_page';
  static const String contactUsPage = '/contact_us_page';
}

class WebRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic> arguments = Map<String, dynamic>.from(settings.arguments == null ? {} : settings.arguments as Map<String, dynamic>);

    switch (settings.name) {
      case RoutePaths.homePage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomePage(),
        );
      case RoutePaths.catalogPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CatalogPage(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
