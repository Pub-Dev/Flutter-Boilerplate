import 'package:Flutter_Boilerplate/core/internationalization/translated/translated.dart';

import '../translated/login_translated.dart';

class LanguagePT implements Translated{
  @override
  LoginTranslated login = LoginTranslated(
    loginPlaceholder: "login",
    passwordPlaceholder: "senha",
    loginButton: "Logar"
  );
}