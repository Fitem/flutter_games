import 'package:flutter/material.dart';
import 'package:flutter_games/common/localization/app_string_base.dart';
import 'package:flutter_games/common/localization/app_string_en.dart';
import 'package:flutter_games/common/localization/app_string_zh.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static Map<String, AppStringBase> _localizedValues = {
    'en' : new AppStringEn(),
    'zh' : new APPStringZh(),
  };

  AppStringBase get currentLocalized {
     if(_localizedValues.containsKey(locale.languageCode)){
       return _localizedValues[locale.languageCode];
     }
     return _localizedValues["zh"];
  }

  ///通过 Localizations 加载当前的 AppLocalizations
  ///获取对应的 AppStringBase
  static AppLocalizations of (BuildContext context){
    return Localizations.of(context, AppLocalizations);
  }

  ///通过 Localizations 加载当前的 AppLocalizations
  ///获取对应的 AppStringBase
  static AppStringBase i18n(BuildContext context) {
    return (Localizations.of(context, AppLocalizations) as AppLocalizations)
        .currentLocalized;
  }
}