import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class AuthFailure extends Failure {
  final String message;

  AuthFailure({required this.message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}
