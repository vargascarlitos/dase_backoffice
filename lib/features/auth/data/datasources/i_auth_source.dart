import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthSource {
  Future<User> login({required String email, required String password});


  Future<Stream<User?>> authStatus();

  Future<User?> currentUser();
}
