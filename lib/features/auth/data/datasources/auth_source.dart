import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthSource {
  Future<Either<AuthFailure, User>> login({required String email, required String password});
}