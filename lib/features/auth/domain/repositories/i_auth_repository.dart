import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:dase_backoffice/features/auth/domain/entities/user_creadential_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<Either<Failure, User>> signInWithFirebase(
      {required UserCredentialEntity userCredentialEntity});

  Future<Either<Failure, Stream<User?>>> authStatusChanges();

  Future<Either<Failure, User?>> currentUser();
}
