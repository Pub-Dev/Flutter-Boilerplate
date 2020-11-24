import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginEntity extends Equatable {
  final String login;
  final String password;

  LoginEntity({
    @required this.login, 
    @required this.password
  });

  @override
  List<Object> get props => [login, password];
}