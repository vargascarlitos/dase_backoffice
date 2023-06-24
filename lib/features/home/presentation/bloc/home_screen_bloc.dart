import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dase_backoffice/core/usecase/usecase.dart';
import 'package:dase_backoffice/features/auth/domain/usescases/auth_sign_out_with_firebase_usecase.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final AuthSignOutWithFirebaseUseCase _authSignOutWithFirebaseUseCase;

  HomeScreenBloc(
      {required AuthSignOutWithFirebaseUseCase authSignOutWithFirebaseUseCase})
      : _authSignOutWithFirebaseUseCase = authSignOutWithFirebaseUseCase,
        super(HomeScreenInitial()) {
    on<HomeScreenSignOut>((event, emit) async {
      final eitherResult = await _authSignOutWithFirebaseUseCase(NoEntity());

      eitherResult.fold((error) =>
          emit(HomeScreenWithoutSessionError(message: error.message)), (
          success) => emit(HomeScreenWithoutSessionSuccess()));
    });
  }
}
