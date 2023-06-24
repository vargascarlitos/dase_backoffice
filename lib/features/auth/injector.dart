import 'package:dase_backoffice/features/auth/data/datasources/auth_firebase_data_source.dart';
import 'package:dase_backoffice/features/auth/data/datasources/i_auth_source.dart';
import 'package:dase_backoffice/features/auth/data/repositories/auth_repository.dart';
import 'package:dase_backoffice/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:dase_backoffice/features/auth/domain/usescases/auth_current_user_usecase.dart';
import 'package:dase_backoffice/features/auth/domain/usescases/auth_sing_in_with_firebase_usecase.dart';
import 'package:dase_backoffice/features/auth/domain/usescases/auth_status_changes_firebase_usecase.dart';
import 'package:dase_backoffice/features/auth/presentation/login/bloc/auth/auth_bloc.dart';
import 'package:dase_backoffice/features/auth/presentation/login/bloc/login_form/login_form_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initAuthInjector() async {
  getIt.registerLazySingleton<IAuthSource>(
    () => AuthFirebaseDataSource(firebaseAuth: FirebaseAuth.instance),
  );
  getIt.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(
      authFirebaseDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => AuthSingInWithFirebaseUseCase(
      authRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => AuthStatusChangesFirebaseUseCase(
      authRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => AuthCurrentUserUseCase(
      authRepository: getIt(),
    ),
  );

  getIt.registerFactory(
    () => LoginFormBloc(
      authSignInWithFirebaseUseCase: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => AuthBloc(
      authStatusChangesFirebaseUseCase: getIt(),
      authCurrentUserUseCase: getIt(),
    ),
  );
}
