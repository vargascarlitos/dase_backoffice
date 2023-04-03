import 'package:dase_backoffice/features/auth/data/datasources/auth_firebase_data_source.dart';
import 'package:dase_backoffice/features/auth/data/datasources/auth_source.dart';
import 'package:dase_backoffice/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initAuthInjector() async {
  getIt.registerLazySingleton<AuthSource>(
        () => AuthFirebaseDataSourceImpl(FirebaseAuth.instance),
  );

  getIt.registerFactory(() => LoginBloc(authFirebaseDataSource: getIt()));
}