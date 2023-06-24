import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:dase_backoffice/core/usecase/usecase.dart';
import 'package:dase_backoffice/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthStatusChangesFirebaseUseCase
    extends UseCase<Stream<User?>, NoEntity> {
  final IAuthRepository _authRepository;

  AuthStatusChangesFirebaseUseCase({required IAuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, Stream<User?>>> call(NoEntity entity) async {
    final resultAuthStatusChanges = await _authRepository.authStatusChanges();

    return resultAuthStatusChanges;
  }
}
