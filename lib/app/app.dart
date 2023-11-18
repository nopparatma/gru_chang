import 'dart:io';

import 'package:catcher/core/catcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/shared/ui_config.dart';
import 'package:gru_chang/ui/page/home_page.dart';
import 'package:gru_chang/ui/router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'app_config.dart';

class MainAppLocalization extends StatelessWidget {
  const MainAppLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('th'),
      ],
      path: 'assets/languages',
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayColor: Colors.black,
        overlayWidgetBuilder: (progress) => buildOverlayLoader(),
        child: buildChild(),
      ),
    );
  }

  buildChild() {
    if (kIsWeb) {
      return const MainWeb();
    } else if (Platform.isAndroid || Platform.isIOS) {
      // return MainApp();
    }
  }

  Widget buildOverlayLoader() {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.lightGreen,
        size: 100,
      ),
    );
  }
}

class MainWeb extends StatefulWidget {
  const MainWeb({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainWebState createState() => _MainWebState();
}

class _MainWebState extends State<MainWeb> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (detail) => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp(
        title: AppConfig.instance.applicationName,
        theme: ThemeData(
          fontFamily: appFontFamily,
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
            fontFamily: appFontFamily,
          ),
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: (context, widget) => ResponsiveBreakpoints.builder(
          child: BouncingScrollWrapper.builder(context, widget!),
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        navigatorKey: Catcher.navigatorKey,
        onGenerateRoute: WebRouter.generateRoute,
        home: const HomePage(),
      ),
    );
  }
}

class AppLogger extends Logger {
  static final AppLogger _instance = AppLogger._internal();

  factory AppLogger() {
    _instance;
    return _instance;
  }

  AppLogger._internal()
      : super(
          printer: PrettyPrinter(
            printEmojis: false,
            methodCount: 0,
          ),
        );

  static AppLogger get instance {
    return _instance;
  }
}
