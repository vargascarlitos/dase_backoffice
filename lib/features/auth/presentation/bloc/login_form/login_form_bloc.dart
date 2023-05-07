import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:dase_backoffice/core/validators/email_input.dart';
import 'package:dase_backoffice/core/validators/password_input.dart';
import 'package:dase_backoffice/features/auth/domain/entities/user_creadential_entity.dart';
import 'package:dase_backoffice/features/auth/domain/usescases/auth_sing_in_with_firebase_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';

part 'login_form_event.dart';

part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final AuthSingInWithFirebaseUseCase _authSignInWithFirebaseUseCase;

  FormzStatus _validate(FormzInput oldInput, FormzInput newInput) {
    return Formz.validate([
      state.emailInput!,
      state.passwordInput!,
      newInput,
    ]
      ..remove(oldInput));
  }

  LoginFormBloc(
      {required AuthSingInWithFirebaseUseCase authSignInWithFirebaseUseCase})
      : _authSignInWithFirebaseUseCase = authSignInWithFirebaseUseCase,
        super(const LoginFormState()) {
    on<LoginFormWithEmailEvent>((event, emit) async {
      if (state.status!.isValidated) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        final Either<Failure, User> result =
        await _authSignInWithFirebaseUseCase(UserCredentialEntity(
            email: event.email, password: event.password));
        emit(result.fold(
              (failure) =>
              state.copyWith(
                  status: FormzStatus.submissionFailure,
                  errorMessage: failure.message),
              (success) =>
              state.copyWith(
                  status: FormzStatus.submissionSuccess,
                  passwordInput: const PasswordInput.pure(),
                  emailInput: const EmailInput.pure()),
        ));
      }
    });

    on<LoginFormEmailChanged>((event, emit) {
      final emailInput = EmailInput.dirty(value: event.emailText);
      emit(state.copyWith(
          emailInput: emailInput,
          status: _validate(state.emailInput!, emailInput)));
    });

    on<LoginFormPasswordChanged>((event, emit) {
      final passwordInput = PasswordInput.dirty(value: event.passwordText);
      emit(state.copyWith(
        passwordInput: passwordInput,
        status: _validate(state.passwordInput!, passwordInput),
      ));
    });

    on<LoginFormObscuredTextChanged>((event, emit) {
      emit(state.copyWith(
          obscureText: event.obscuredText));
      });

    on<LoginFormReset>((event, emit) {
      emit(state.copyWith(status: FormzStatus.pure));
    });
  }
}
