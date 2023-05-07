import 'package:formz/formz.dart';

enum PasswordValidationError { isEmpty, invalid }

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure("");

  const PasswordInput.dirty({required String value}) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value.length < 8) {
      return PasswordValidationError.invalid;
    }
    if (value.isEmpty) {
      return PasswordValidationError.isEmpty;
    }
    return null;
  }
}

extension PasswordValidationErorrMessage on PasswordValidationError {
  String? get message {
    switch(this) {
      case PasswordValidationError.isEmpty:
        return "Ingrese su contraseña";
      case PasswordValidationError.invalid:
        return "Ingrese una contraseña con más de 8 caracteres";
    }
  }
}
