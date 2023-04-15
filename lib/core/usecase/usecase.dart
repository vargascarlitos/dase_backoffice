import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:equatable/equatable.dart';


abstract class UseCase<Type, Entity> {
  Future<Either<Failure, Type>> call(Entity entity);
}

class NoEntity extends Equatable {
  @override
  List<Object> get props => [];
}