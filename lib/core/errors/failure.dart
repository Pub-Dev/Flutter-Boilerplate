import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  Failure();
}

class ServerFailure extends Failure{
  @override
  List<Object> get props => [];
}

class CriptFailure extends Failure{
  @override
  List<Object> get props => [];
}