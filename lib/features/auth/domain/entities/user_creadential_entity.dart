import 'package:equatable/equatable.dart';

class UserCredentialEntity extends Equatable{
  String email;
  String password;

  UserCredentialEntity({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
