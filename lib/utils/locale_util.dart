import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class LocaleUtil {
  static changeLanguage(BuildContext context) {
    Locale? currentLocale = EasyLocalization.of(context)?.currentLocale;
    if (currentLocale == const Locale('en')) {
      EasyLocalization.of(context)?.setLocale(const Locale('th'));
    } else {
      EasyLocalization.of(context)?.setLocale(const Locale('en'));
    }
  }
}
