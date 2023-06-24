import 'package:dase_backoffice/core/validators/email_input.dart';
import 'package:dase_backoffice/core/validators/password_input.dart';
import 'package:dase_backoffice/features/auth/presentation/login/bloc/login_form/login_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(25.0)),
        padding: const EdgeInsets.all(24.0),
        width: 400.0,
        height: 500.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Inicio de sesión",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.black),
            ),
            _EmailTextInput(),
            const SizedBox(height: 24.0),
            _PasswordTextInput(),
            const SizedBox(height: 24.0),
            _LoginButton()
          ],
        ),
      ),
    );
  }
}

class _EmailTextInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.emailInput != current.emailInput ||
          previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: "Correo",
            hintText: "Ingresá tu correo",
            prefix: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Icon(Icons.email),
            ),
            errorText: state.emailInput!.invalid
                ? state.emailInput!.error?.message
                : null,
          ),
          onChanged: (newText) {
            context
                .read<LoginFormBloc>()
                .add(LoginFormEmailChanged(emailText: newText));
          },
        );
      },
    );
  }
}

class _PasswordTextInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.passwordInput != current.passwordInput ||
          previous.status != current.status ||
          current.obscureText != previous.obscureText,
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: "Contraseña",
            hintText: "Ingresa tu contraseña",
            suffixIcon: IconButton(
                onPressed: () {
                  context.read<LoginFormBloc>().add(
                      LoginFormObscuredTextChanged(
                          obscuredText: !state.obscureText!));
                },
                icon: state.obscureText!
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off)),
            prefix: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Icon(Icons.password),
            ),
            errorText: state.passwordInput!.invalid
                ? state.passwordInput!.error!.message
                : null,
          ),
          obscureText: state.obscureText!,
          onChanged: (value) => context
              .read<LoginFormBloc>()
              .add(LoginFormPasswordChanged(passwordText: value)),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.passwordInput != current.passwordInput ||
          previous.emailInput != current.emailInput ||
          previous.obscureText != current.obscureText,
      builder: (context, state) {
        return ElevatedButton(
            onPressed: state.status!.isValidated
                ? () {
                    context.read<LoginFormBloc>().add(
                          LoginFormWithEmailEvent(
                            email: state.emailInput!.value,
                            password: state.passwordInput!.value,
                          ),
                        );
                  }
                : null,
            child: const Text("Iniciar Sesión"));
      },
    );
  }
}
