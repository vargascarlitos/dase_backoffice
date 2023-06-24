import 'package:dase_backoffice/core/dependency_injection/dependency_injection_config.dart';
import 'package:dase_backoffice/core/utils/dase_theme.dart';
import 'package:dase_backoffice/core/routes/router.dart';
import 'package:dase_backoffice/features/auth/presentation/login/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: MaterialApp.router(
        title: 'Dase BackOffice',
        theme: DaseTheme.lightTheme,
        darkTheme: DaseTheme.darkTheme,
        themeMode: ThemeMode.dark,
        routerConfig: router,
      ),
    );
  }
}
