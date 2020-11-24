import 'package:flutter/widgets.dart';

import 'login_translated.dart';

abstract class Translated {
  static Translated of(BuildContext context) {
    return Localizations.of<Translated>(context, Translated);
  }

  LoginTranslated login;
}
