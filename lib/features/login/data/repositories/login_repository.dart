import 'package:Flutter_Boilerplate/core/errors/exceptions.dart';
import 'package:Flutter_Boilerplate/core/errors/failure.dart';
import 'package:Flutter_Boilerplate/features/login/data/datasources/autenticate_remote_datasource.dart';
import 'package:Flutter_Boilerplate/features/login/domain/entities/autenticate.dart';
import 'package:Flutter_Boilerplate/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class LoginRepository extends ALoginRepository{

  final AAutenticateRemoteDataSource autenticateRemoteDataSource;

  LoginRepository({
    @required this.autenticateRemoteDataSource
  });

  @override
  Future<Either<Failure, AutenticateEntity>> login(String login, String password) async {
    try{
      return Right(await autenticateRemoteDataSource.login(login, password));
    } on CriptException catch(_){
      return Left(CriptFailure());
    }
    on ServerException catch(_){
      return Left(ServerFailure());
    }
  }
}