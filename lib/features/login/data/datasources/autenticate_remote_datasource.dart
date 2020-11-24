import 'package:Flutter_Boilerplate/core/http/http.dart';
import 'package:Flutter_Boilerplate/features/login/data/models/autenticate_model.dart';
import 'package:Flutter_Boilerplate/features/login/data/models/login_model.dart';
import 'package:meta/meta.dart';

abstract class AAutenticateRemoteDataSource {
  Future<AutenticateModel> login(String login, String password);
}

class AutenticateRemoteDataSource extends AAutenticateRemoteDataSource{

  final String action = "login";
  final AHttp http;

  AutenticateRemoteDataSource({
    @required this.http
  });

  @override
  Future<AutenticateModel> login(String login, String password) async {
    var response = await http.post(action, LoginModel(login: login, password: password).toMap());
    return AutenticateModel.create(response);
  }
}