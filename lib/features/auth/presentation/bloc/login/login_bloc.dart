import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:dase_backoffice/core/usecase/usecase.dart';
import 'package:dase_backoffice/features/auth/data/datasources/auth_firebase_data_source.dart';
import 'package:dase_backoffice/features/auth/data/datasources/i_auth_source.dart';
import 'package:dase_backoffice/features/auth/domain/entities/user_creadential_entity.dart';
import 'package:dase_backoffice/features/auth/domain/usescases/auth_sing_in_with_firebase_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthSingInWithFirebaseUseCase _authSignInWithFirebaseUseCase;

  LoginBloc(
      {required AuthSingInWithFirebaseUseCase authSignInWithFirebaseUseCase})
      : _authSignInWithFirebaseUseCase = authSignInWithFirebaseUseCase,
        super(LoginInitial()) {
    on<LoginWithEmailEvent>((event, emit) async {
      emit(LoginLoading());
      final Either<Failure, User> result =
          await _authSignInWithFirebaseUseCase.call(UserCredentialEntity(
              email: event.email, password: event.password));
      emit(result.fold(
        (failure) => LoginFailureState(failure: failure as AuthFailure),
        (user) => LoginSuccess(user: user),
      ));
    });
  }
}
