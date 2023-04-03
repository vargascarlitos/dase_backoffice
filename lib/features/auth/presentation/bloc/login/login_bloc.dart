import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:dase_backoffice/features/auth/data/datasources/auth_firebase_data_source.dart';
import 'package:dase_backoffice/features/auth/data/datasources/auth_source.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthSource _authFirebaseDataSource;

  LoginBloc({required AuthSource authFirebaseDataSource})
      : _authFirebaseDataSource = authFirebaseDataSource,
        super(LoginInitial()) {
    on<LoginWithEmailEvent>((event, emit) async {
      emit(LoginLoading());
      final Either<Failure, User> result =
          await authFirebaseDataSource.login(
        email: event.email,
        password: event.password,
      );
      emit(result.fold(
        (failure) => LoginFailureState(failure: failure as AuthFailure),
        (user) => LoginSuccess(user: user),
      ));
    });
  }
}
