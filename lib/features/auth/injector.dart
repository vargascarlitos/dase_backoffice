import 'package:dase_backoffice/core/usecase/usecase.dart';
import 'package:dase_backoffice/features/auth/data/datasources/auth_firebase_data_source.dart';
import 'package:dase_backoffice/features/auth/data/datasources/i_auth_source.dart';
import 'package:dase_backoffice/features/auth/data/repositories/auth_repository.dart';
import 'package:dase_backoffice/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:dase_backoffice/features/auth/domain/usescases/auth_sing_in_with_firebase_usecase.dart';
import 'package:dase_backoffice/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initAuthInjector() async {
  getIt.registerLazySingleton<IAuthSource>(
    () => AuthFirebaseDataSource(firebaseAuth: FirebaseAuth.instance),
  );
  getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(authFirebaseDataSource: getIt()));

  getIt.registerLazySingleton<AuthSingInWithFirebaseUseCase>(
      () => AuthSingInWithFirebaseUseCase(authRepository: getIt()));

  getIt.registerFactory(() => LoginBloc(authSignInWithFirebaseUseCase: getIt()));
}
