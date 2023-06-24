import 'package:dase_backoffice/features/auth/presentation/login/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, required this.routerState}) : super(key: key);

  final GoRouterState routerState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Error: ${routerState.error}",
              style: const TextStyle(color: Colors.black45),
            ),
            MaterialButton(
              onPressed: () {
                GoRouter.of(context).pushReplacementNamed(LoginScreen.name);
              },
              color: Colors.black,
              textColor: Colors.white,
              child: const Text("Aceptar"),
            )
          ],
        ),
      ),
    );
  }
}
