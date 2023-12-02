import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:gru_chang/app/app_constant.dart';
import 'package:gru_chang/utils/string_util.dart';

class LanguageUtil {
  static changeLanguage(BuildContext context, String? language) {
    const String defaultLanguage = 'th';

    // Default language
    if (StringUtil.isNullOrEmpty(language)) {
      EasyLocalization.of(context)?.setLocale(const Locale(defaultLanguage));
      return;
    }

    // Set language
    EasyLocalization.of(context)?.setLocale(Locale(language ?? AppConstant.emptyString));
  }
}
