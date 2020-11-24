import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../app.dart';
import '../localization_delegate.dart';

enum LanguageCode{
  PT,
  EN,
  ES
}

abstract class ALanguage{
  Locale locale;
  LanguageCode code;
  set(BuildContext buildContext, LanguageCode language);
  Iterable<Locale> support();
  Iterable<LocalizationsDelegate<dynamic>> localizations();
}

class Language extends ALanguage {
  Locale locale;
  LanguageCode code;

  @override
  set(BuildContext buildContext, LanguageCode languageCode) {
    this.code = languageCode;
    switch(languageCode){
      case LanguageCode.PT:
        locale = Locale('pt', '');
        break;
      case LanguageCode.EN:
        locale = Locale('en', '');
        break;
      case LanguageCode.ES:
        locale = Locale('es', '');
        break;
      default:
        locale = Locale('pt', '');
    }
    App.updateState(buildContext);
  }

  @override
  Iterable<Locale> support() => [
    Locale('pt', ''),
    Locale('en', ''),
    Locale('es', ''),
  ];

  @override
  Iterable<LocalizationsDelegate> localizations() => [
    AppLocalizationDelegate(),
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ];
}