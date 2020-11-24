import 'package:Flutter_Boilerplate/core/internationalization/translated/translated.dart';

import '../translated/login_translated.dart';

class LanguageEN implements Translated{
  @override
  LoginTranslated login = LoginTranslated(
    loginPlaceholder: "login",
    passwordPlaceholder: "password",
    loginButton: "Login"
  );
}