import 'package:get_it/get_it.dart';
import 'package:dase_backoffice/features/auth/presentation/injector.dart' as auth;

final GetIt getIt = GetIt.instance;


Future<void> setup() async {
  auth.initAuthInjector();
}