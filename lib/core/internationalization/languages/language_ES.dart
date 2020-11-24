import 'package:Flutter_Boilerplate/core/internationalization/translated/translated.dart';

import '../translated/login_translated.dart';

class LanguageES implements Translated{
  @override
  LoginTranslated login = LoginTranslated(
    loginPlaceholder: "login",
    passwordPlaceholder: "password",
    loginButton: "Login"
  );
}