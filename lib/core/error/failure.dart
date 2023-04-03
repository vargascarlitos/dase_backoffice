import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class AuthFailure extends Failure {
  final String message;

  AuthFailure({required this.message});

  @override
  List<Object?> get props => [message];
}