import 'package:Flutter_Boilerplate/core/dependecyInjection/dependecy_injection.dart';
import 'package:Flutter_Boilerplate/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'core/internationalization/languages/language.dart';

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
  ALanguage language;
  ARoute route;

  @override
  void initState() {
    super.initState();
    route = ADependencyInjection.singleton.get<ARoute>();
    language = ADependencyInjection.singleton.get<ALanguage>();
    language.locale = language.support().first;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: route.initial,
      routes: route.routes,
      debugShowCheckedModeBanner: false,
      locale: language.locale,
      supportedLocales: language.support(),
      localizationsDelegates: language.localizations(),
      localeResolutionCallback: (locale, supportedLocales){
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale?.languageCode == locale?.languageCode &&
              supportedLocale?.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales?.first;
      },
    );
  }
}