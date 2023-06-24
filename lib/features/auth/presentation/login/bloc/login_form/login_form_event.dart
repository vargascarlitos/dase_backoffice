part of 'login_form_bloc.dart';

abstract class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  List<Object?> get props => [];
}

class LoginFormEmailChanged extends LoginFormEvent {
  final String emailText;

  const LoginFormEmailChanged({required this.emailText});

  @override
  List<Object?> get props => [emailText];
}

class LoginFormPasswordChanged extends LoginFormEvent {
  final String passwordText;

  const LoginFormPasswordChanged({required this.passwordText});

  @override
  List<Object?> get props => [passwordText];
}

class LoginFormObscuredTextChanged extends LoginFormEvent {
  final bool obscuredText;

  const LoginFormObscuredTextChanged({required this.obscuredText});

  @override
  List<Object?> get props => [obscuredText];
}

class LoginFormWithEmailEvent extends LoginFormEvent {
  final String email;
  final String password;

  const LoginFormWithEmailEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LoginFormReset extends LoginFormEvent {
  @override
  List<Object?> get props => [];
}
