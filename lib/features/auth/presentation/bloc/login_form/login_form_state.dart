part of 'login_form_bloc.dart';

class LoginFormState extends Equatable {
  final FormzStatus? status;
  final EmailInput? emailInput;
  final PasswordInput? passwordInput;
  final String? errorMessage;
  final bool? obscureText;

  const LoginFormState(
      {this.status = FormzStatus.pure,
      this.emailInput = const EmailInput.pure(),
      this.passwordInput = const PasswordInput.pure(),
      this.errorMessage,
      this.obscureText = true});

  LoginFormState copyWith({
    FormzStatus? status,
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    String? errorMessage,
    bool? obscureText,
  }) {
    return LoginFormState(
      status: status ?? this.status,
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      errorMessage: errorMessage ?? this.errorMessage,
      obscureText: obscureText ?? this.obscureText,
    );
  }

  @override
  List<Object?> get props => [status, emailInput, passwordInput, obscureText];
}
