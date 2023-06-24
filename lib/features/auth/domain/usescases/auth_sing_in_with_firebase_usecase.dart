import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:dase_backoffice/core/usecase/usecase.dart';
import 'package:dase_backoffice/features/auth/domain/entities/user_creadential_entity.dart';
import 'package:dase_backoffice/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthSingInWithFirebaseUseCase
    extends UseCase<User, UserCredentialEntity> {
  final IAuthRepository _authRepository;

  AuthSingInWithFirebaseUseCase({required IAuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, User>> call(UserCredentialEntity entity) async {
    final resultSingIn = await _authRepository.signInWithFirebase(userCredentialEntity: entity);
    return resultSingIn;
  }
}
