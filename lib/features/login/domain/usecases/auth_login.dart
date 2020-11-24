import 'package:Flutter_Boilerplate/core/errors/failure.dart';
import 'package:Flutter_Boilerplate/core/useCases/usecase.dart';
import 'package:Flutter_Boilerplate/features/login/domain/entities/autenticate.dart';
import 'package:Flutter_Boilerplate/features/login/domain/entities/login.dart';
import 'package:Flutter_Boilerplate/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class AuthLogin extends UseCase<AutenticateEntity, LoginEntity>{
  final ALoginRepository loginRepository;

  AuthLogin({@required this.loginRepository});

  @override
  Future<Either<Failure, AutenticateEntity>> call(LoginEntity params) async {
    return await loginRepository.login(params.login, params.password);
  }
}