import 'dart:ui';

import 'package:Flutter_Boilerplate/core/internationalization/languages/language_EN.dart';
import 'package:Flutter_Boilerplate/core/internationalization/languages/language_PT.dart';
import 'package:Flutter_Boilerplate/core/internationalization/translated/translated.dart';
import 'package:flutter/widgets.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<Translated> {
  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<Translated> load(Locale locale) => _load(locale);

  static Future<Translated> _load(Locale locale) async {
    switch(locale.languageCode) {
      case 'en':
        return LanguageEN();
      case 'pt':
        return LanguagePT();
      default:
        return LanguagePT();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate old) => false;
}