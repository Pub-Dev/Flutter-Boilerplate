import 'package:Flutter_Boilerplate/core/cryptography/aes_criptography_service.dart';
import 'package:Flutter_Boilerplate/core/cryptography/cryptography_service.dart';
import 'package:Flutter_Boilerplate/core/database/database.dart';
import 'package:Flutter_Boilerplate/core/database/sqflite_database.dart';
import 'package:Flutter_Boilerplate/core/errors/exceptions.dart';
import 'package:Flutter_Boilerplate/core/http/http.dart';
import 'package:Flutter_Boilerplate/core/http/http_autorized.dart';
import 'package:Flutter_Boilerplate/core/internationalization/languages/language.dart';
import 'package:Flutter_Boilerplate/core/useCases/usecase.dart';
import 'package:Flutter_Boilerplate/features/login/data/datasources/autenticate_remote_datasource.dart';
import 'package:Flutter_Boilerplate/features/login/data/repositories/login_repository.dart';
import 'package:Flutter_Boilerplate/features/login/domain/entities/autenticate.dart';
import 'package:Flutter_Boilerplate/features/login/domain/entities/login.dart';
import 'package:Flutter_Boilerplate/features/login/domain/repositories/login_repository.dart';
import 'package:Flutter_Boilerplate/features/login/domain/usecases/auth_login.dart';
import 'package:Flutter_Boilerplate/features/login/presentation/stores/login_store.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'dependecy_injection.dart';

class GetItDependency extends ADependencyInjection{
  
  @override
  init() async {
    try{
      ADependencyInjection.singleton = this;
      final instance = GetIt.instance;

      //! Core
      instance.registerLazySingleton<ALanguage>(() => Language());
      instance.registerLazySingleton<ACryptographyService>(() => AESCriptographyService());
      instance.registerLazySingleton<http.Client>(() => http.Client());
      instance.registerLazySingleton<ADataBase>(() => SqfliteDataBase());
      instance.registerLazySingleton<AHttp>(() => Http(client: get(), cryptographyService: get()), instanceName: InstanceName.http);
      instance.registerLazySingleton<AHttp>(() => HttpAutorized(http: get(InstanceName.http)), instanceName: InstanceName.httpAutorized);

      _loginInstances(instance);
    } on WaitingTimeOutException catch(ex){
      throw DependencyInjectionException(ex.toString());
    } on Exception catch(ex){
      throw ex;
    }
  }

  @override
  T get<T>([String nameInstance]) {
    try{
      if(nameInstance != null)
        return GetIt.instance.get<T>(instanceName: nameInstance);
      return GetIt.instance.get<T>();
    } on WaitingTimeOutException catch(ex){
      throw DependencyInjectionException(ex.toString());
    } on AssertionError catch(ex){
      throw DependencyInjectionException(ex.message);
    } on Exception catch(ex){
      throw ex;
    }
  }

  _loginInstances(GetIt instance){
    instance.registerLazySingleton<AAutenticateRemoteDataSource>(() => AutenticateRemoteDataSource(http: get(InstanceName.http)));
    instance.registerLazySingleton<ALoginRepository>(() => LoginRepository(autenticateRemoteDataSource: get()));
    instance.registerLazySingleton<UseCase<AutenticateEntity, LoginEntity>>(() => AuthLogin(loginRepository: get()));
    instance.registerLazySingleton<LoginStore>(() => LoginStore(auth: get<UseCase<AutenticateEntity, LoginEntity>>(), language: get()));
  }
}

class InstanceName {
  static const String http = "Http";
  static const String httpAutorized = "HttpAutorized";
}