import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/features/auth/data/datasources/i_auth_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseDataSource implements IAuthSource {
  final FirebaseAuth _firebaseAuth;

  AuthFirebaseDataSource({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User> login(
      {required String email, required String password}) async {
    final UserCredential userCredential =
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!;
  }
}
