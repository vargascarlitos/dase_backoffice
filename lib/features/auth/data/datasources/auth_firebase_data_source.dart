import 'package:dartz/dartz.dart';
import 'package:dase_backoffice/core/error/failure.dart';
import 'package:dase_backoffice/features/auth/data/datasources/auth_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseDataSourceImpl implements AuthSource {
  final FirebaseAuth _firebaseAuth;

  AuthFirebaseDataSourceImpl(this._firebaseAuth);

  @override
  Future<Either<AuthFailure, User>> login(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure(message: e.message ?? 'Error al contectarse con firebase'));
    } catch (e) {
      return left(AuthFailure(message: 'Ocurrio un error al realizar el inisio de sesión'));
    }
  }
}
