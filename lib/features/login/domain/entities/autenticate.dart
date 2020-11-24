import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AutenticateEntity extends Equatable{
  final String token;
  final String subscriptionKey;

  AutenticateEntity({
    @required this.token,
    @required this.subscriptionKey
  });

  @override
  List<Object> get props => [token, subscriptionKey];
}