import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:dase_backoffice/features/auth/data/datasources/i_auth_source.dart';
import 'package:dase_backoffice/features/auth/domain/entities/user_creadential_entity.dart';
import 'package:dase_backoffice/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAuthRepository {
  final IAuthSource _authFirebaseDataSource;

  AuthRepository({required IAuthSource authFirebaseDataSource})
      : _authFirebaseDataSource = authFirebaseDataSource;

  @override
  Future<Either<Failure, User>> signInWithFirebase(
      {required UserCredentialEntity userCredentialEntity}) async {
    try {
      final signInResult =
          await _authFirebaseDataSource.login(email: userCredentialEntity.email, password: userCredentialEntity.password);

      return right(signInResult);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure(
          message: e.message ??
              "A ocurrida un error al realizar el login con firebase"));
    }
  }
}
