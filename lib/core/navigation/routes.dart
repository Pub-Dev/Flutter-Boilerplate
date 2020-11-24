import 'package:Flutter_Boilerplate/core/dependecyInjection/dependecy_injection.dart';
import 'package:Flutter_Boilerplate/features/login/presentation/pages/login_page.dart';
import 'package:flutter/widgets.dart';

abstract class ARoute{
  String initial;
  Map<String, WidgetBuilder> routes;
}

class Route implements ARoute {
  String initial = RouteNamed.splash.path;

  Map<String, WidgetBuilder> routes = {
    RouteNamed.home.path:   (context) => LoginPage(loginStore: ADependencyInjection.singleton.get()),
    RouteNamed.login.path:  (context) => LoginPage(loginStore: ADependencyInjection.singleton.get()),
    RouteNamed.splash.path:  (context) => LoginPage(loginStore: ADependencyInjection.singleton.get()),
  };
}

enum RouteNamed {
  home,
  login,
  splash
}

extension RouteNamedExtension on RouteNamed{
  String get path {
    switch(this){
      case RouteNamed.login:
        return '/login';
      case RouteNamed.home:
        return '/home';
      case RouteNamed.splash:
        return '/splash';
      default:
        return null;
    }
  }
}