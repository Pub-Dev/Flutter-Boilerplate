import 'package:Flutter_Boilerplate/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Dynamic>{
  Future<Either<Failure, Type>> call(Dynamic params);
}