import 'package:Flutter_Boilerplate/core/json/json_model.dart';
import 'package:Flutter_Boilerplate/features/login/domain/entities/login.dart';
import 'package:meta/meta.dart';

class LoginModel extends LoginEntity implements JsonModel{
  LoginModel({
    @required String login,
    @required String password
  });

  @override
  Map<String, dynamic> toMap(){
    return {
      "login": this.login,
      "password": this.password
    };
  }
}