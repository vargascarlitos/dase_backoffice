import 'package:get_it/get_it.dart';
import 'package:dase_backoffice/features/auth/injector.dart' as auth;
import 'package:dase_backoffice/features/home/injector.dart' as home;

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  auth.initAuthInjector();
  home.initHomeInjector();
}