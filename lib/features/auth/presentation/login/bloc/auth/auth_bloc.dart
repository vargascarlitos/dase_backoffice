import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:dase_backoffice/core/usecase/usecase.dart';
import 'package:dase_backoffice/features/auth/domain/usescases/auth_current_user_usecase.dart';
import 'package:dase_backoffice/features/auth/domain/usescases/auth_status_changes_firebase_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthStatusChangesFirebaseUseCase _authStatusChangesFirebaseUseCase;
  final AuthCurrentUserUseCase _authCurrentUserUseCase;
  late final StreamSubscription<Either<Failure, Stream<User?>>>
      _userSubscription;

  AuthBloc(
      {required AuthStatusChangesFirebaseUseCase
          authStatusChangesFirebaseUseCase,
      required AuthCurrentUserUseCase authCurrentUserUseCase})
      : _authStatusChangesFirebaseUseCase = authStatusChangesFirebaseUseCase,
        _authCurrentUserUseCase = authCurrentUserUseCase,
        super(const AuthState.unauthenticated()) {
    on<AuthUserChanged>((event, emit) {
      print("Este es el usuario: ${event.user}");
      emit(
        event.user != null
            ? AuthState.authenticated(event.user!)
            : const AuthState.unauthenticated(),
      );
    });
    _userSubscription = _authStatusChangesFirebaseUseCase(NoEntity())
        .asStream()
        .listen((eitherResult) {
      eitherResult.fold(
        (l) => null,
        (user) => user.listen((user) {
          add(
            AuthUserChanged(user: user),
          );
        }),
      );
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
