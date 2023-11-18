import 'package:catcher/core/catcher.dart';
import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/mode/silent_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gru_chang/app/app.dart';
import 'package:gru_chang/app/app_config.dart';
import 'package:logger/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  AppConfig.dev();

  Logger.level = Level.all;

  CatcherOptions catcherOptions = CatcherOptions(
    SilentReportMode(),
    [ConsoleHandler()],
  );

  Catcher(
    rootWidget: const MainAppLocalization(),
    debugConfig: catcherOptions,
    releaseConfig: catcherOptions,
    profileConfig: catcherOptions,
  );
}
