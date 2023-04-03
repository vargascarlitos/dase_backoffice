import 'package:dase_backoffice/core/dependency_injection/dependency_injection_config.dart';
import 'package:dase_backoffice/core/utils/dase_theme.dart';
import 'package:dase_backoffice/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:dase_backoffice/features/auth/presentation/screen/login_screen.dart';
import 'package:dase_backoffice/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentation/screen/create_costumer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi aplicación',
      theme: DaseTheme.lightTheme,
      darkTheme: DaseTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: LoginScreen.route,
      routes: {
        LoginScreen.route : (context) => BlocProvider(
          create: (_) => getIt<LoginBloc>(),
          child: const LoginScreen(),
        ),
        HomeScreen.route : (context) => HomeScreen(),
        ClienteFormScreen.route : (context) => ClienteFormScreen(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
