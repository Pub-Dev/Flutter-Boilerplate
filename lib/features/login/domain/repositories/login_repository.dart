import 'package:Flutter_Boilerplate/core/errors/failure.dart';
import 'package:Flutter_Boilerplate/features/login/domain/entities/autenticate.dart';
import 'package:dartz/dartz.dart';

abstract class ALoginRepository{
  Future<Either<Failure, AutenticateEntity>> login(String login, String password);
}