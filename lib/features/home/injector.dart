import 'package:dase_backoffice/features/home/presentation/bloc/home_screen_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initHomeInjector() async {
  getIt.registerLazySingleton(
    () => HomeScreenBloc(authSignOutWithFirebaseUseCase: getIt()),
  );
}
