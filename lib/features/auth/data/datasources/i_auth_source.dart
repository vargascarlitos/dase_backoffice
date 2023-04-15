import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthSource {
  Future<User> login({required String email, required String password});
}