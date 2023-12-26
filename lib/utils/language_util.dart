import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:gru_chang/app/app_constant.dart';
import 'package:gru_chang/utils/string_util.dart';

class LanguageUtil {
  static changeLanguage(BuildContext context, String? language) async {
    const String defaultLanguage = 'th';
    Locale locale = const Locale(defaultLanguage);

    // Default language
    if (StringUtil.isNullOrEmpty(language)) {
      await EasyLocalization.of(context)?.setLocale(locale);
      await Get.updateLocale(locale);
      return;
    }

    // Set language
    locale = Locale(language ?? AppConstant.emptyString);
    await EasyLocalization.of(context)?.setLocale(locale);
    await Get.updateLocale(locale);
  }
}
