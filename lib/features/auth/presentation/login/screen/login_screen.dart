import 'package:dase_backoffice/core/dependency_injection/dependency_injection_config.dart';
import 'package:dase_backoffice/features/auth/presentation/login/bloc/login_form/login_form_bloc.dart';
import 'package:dase_backoffice/features/auth/presentation/login/screen/login_form.dart';
import 'package:dase_backoffice/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const path = '/login';
  static const name = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<LoginFormBloc>(),
        child: BlocListener<LoginFormBloc, LoginFormState>(
          listener: (context, state) {
            if (state.status!.isSubmissionFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: Colors.red,
                ));
            }
            if (state.status!.isSubmissionSuccess &&
                state.status!.isValidated) {
              GoRouter.of(context).pushNamed(HomeScreen.name);
              context.read<LoginFormBloc>().add(LoginFormReset());
            }
          },
          child: BlocBuilder<LoginFormBloc, LoginFormState>(
            builder: (context, state) {
              if (state.status!.isSubmissionInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const LoginForm();
            },
          ),
        ),
      ),
    );
  }
}
