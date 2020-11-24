import 'package:Flutter_Boilerplate/core/internationalization/languages/language.dart';
import 'package:Flutter_Boilerplate/features/login/domain/usecases/auth_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store{
  @observable
  String login;
  
  @observable
  String password;

  final AuthLogin authLogin;
  final ALanguage languageService;

  LoginStoreBase({
    @required AuthLogin auth,
    @required ALanguage language
  }) : 
    assert(auth != null),
    assert(language != null),
    authLogin = auth,
    languageService = language;

  @action
  Future<void> autenticate() async {
    // final result = await authLogin(LoginEntity(login: login, password: password));
    
    // result.fold((failure) => {
    //   print(failure)
    // }, (success) => {
    //   print(success.token)
    // });
  }
}