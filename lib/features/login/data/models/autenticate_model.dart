import 'package:Flutter_Boilerplate/core/json/json_model.dart';
import 'package:Flutter_Boilerplate/features/login/domain/entities/autenticate.dart';
import 'package:meta/meta.dart';

class AutenticateModel extends AutenticateEntity implements JsonModel{
  AutenticateModel({
    @required String token,
    @required String subscriptionKey
  }) : super(token: token, subscriptionKey: subscriptionKey);

  factory AutenticateModel.create(Map<String, dynamic> params){
    return AutenticateModel(
      token: params['autentication']['token'],
      subscriptionKey: params['autentication']['subscriptionKey']
    );
  }

  @override
  Map<String, dynamic> toMap(){
    return {
      "token": this.token,
      "subscriptionKey": this.subscriptionKey
    };
  }
}