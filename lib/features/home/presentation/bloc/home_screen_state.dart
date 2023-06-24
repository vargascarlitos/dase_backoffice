part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeScreenWithoutSessionSuccess extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class HomeScreenWithoutSessionError extends HomeScreenState {
  final String message;

  const HomeScreenWithoutSessionError({required this.message});

  @override
  List<Object?> get props => [message];
}
