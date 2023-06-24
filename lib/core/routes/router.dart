import 'package:dase_backoffice/app.dart';
import 'package:dase_backoffice/core/utils/go_router_refresh_stream.dart';
import 'package:dase_backoffice/features/auth/presentation/login/bloc/auth/auth_bloc.dart';
import 'package:dase_backoffice/features/auth/presentation/login/screen/login_screen.dart';
import 'package:dase_backoffice/features/error/presentation/error_screen.dart';
import 'package:dase_backoffice/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

mixin RouterMixin on State<MyApp> {
  final _router = GoRouter(
    initialLocation: LoginScreen.path,
    errorBuilder: (context, state) => ErrorScreen(routerState: state),
    routes: [
      GoRoute(
        name: LoginScreen.name,
        path: LoginScreen.path,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        builder: (context, state) => HomeScreen(),
      ),
    ],
    redirect: (context, state) async {
      final sessionStatus = context.read<AuthBloc>().state.status;
      if (sessionStatus == AuthStatus.unauthenticated) {
        return LoginScreen.path;
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(GetIt.instance<AuthBloc>().stream),
  );

  GoRouter get router => _router;
}
