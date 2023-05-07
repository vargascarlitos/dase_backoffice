import 'package:formz/formz.dart';

enum EmailValidationError { isEmpty, invalid }

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure() : super.pure("");

  const EmailInput.dirty({required String value}) : super.dirty(value);

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.isEmpty;
    }

    if (!_emailRegExp.hasMatch(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}

extension EmailValidationErrorMessage on EmailValidationError {
  String? get message {
    switch (this) {
      case EmailValidationError.isEmpty:
        return "Ingrese un correo";
      case EmailValidationError.invalid:
        return "El correo ingresado no es valido";
      default:
        return null;
    }
  }
}
