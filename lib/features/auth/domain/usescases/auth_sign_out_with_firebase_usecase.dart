import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:dase_backoffice/core/usecase/usecase.dart';
import 'package:dase_backoffice/features/auth/domain/repositories/i_auth_repository.dart';

class AuthSignOutWithFirebaseUseCase extends UseCase<bool, NoEntity> {
  final IAuthRepository _authRepository;

  AuthSignOutWithFirebaseUseCase({required IAuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, bool>> call(NoEntity entity) async {
    final signOut = await _authRepository.signOut();

    return signOut;
  }
}
