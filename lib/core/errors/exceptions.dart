class BaseException implements Exception{
  final String message;
  BaseException([this.message]);
}

class ServerException extends BaseException{}

class CriptException extends BaseException{
  CriptException([String message]) : super(message);
}

class DependencyInjectionException extends BaseException{
  DependencyInjectionException([String message]) : super(message);
}

class SqfliteException extends BaseException{
  SqfliteException([String message]) : super(message);
}