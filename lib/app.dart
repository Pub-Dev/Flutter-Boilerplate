import 'package:Flutter_Boilerplate/core/dependecyInjection/dependecy_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'core/internationalization/languages/language.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/login/presentation/stores/login_store.dart';

class App extends StatefulWidget {

  static void updateState(BuildContext buildContext){
    var state = buildContext.findAncestorStateOfType<_AppState>();
    // ignore: invalid_use_of_protected_member
    state.setState(() {});
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ALanguage languageService;

  @override
  void initState() {
    super.initState();
    languageService = ADependencyInjection.singleton.get<ALanguage>();
    languageService.locale = languageService.support().first;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: languageService.locale,
      supportedLocales: languageService.support(),
      localizationsDelegates: languageService.localizations(),
      localeResolutionCallback: (locale, supportedLocales){
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale?.languageCode == locale?.languageCode &&
              supportedLocale?.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales?.first;
      },
      home: LoginPage(
        loginStore: ADependencyInjection.singleton.get<LoginStore>(),
      ),
    );
  }
}