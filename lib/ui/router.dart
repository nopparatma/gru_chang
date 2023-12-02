import 'package:flutter/material.dart';
import 'package:gru_chang/ui/page/catalog_page.dart';
import 'package:gru_chang/ui/page/contact_us_page.dart';
import 'package:gru_chang/ui/page/home_page.dart';

class RoutePaths {
  static const String index = '/';
  static const String homePage = '/home';
  static const String catalogPage = '/catalog';
  static const String aboutUsPage = '/about_us';
  static const String contactUsPage = '/contact_us';
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
      case RoutePaths.contactUsPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ContactUsPage(),
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
