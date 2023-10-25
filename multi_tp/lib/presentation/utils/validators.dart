import 'package:intl/intl.dart';

class Validators {
  static String? validateEmail(String? email) {
    final RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+");
    if (email!.isEmpty) {
      return "Completar campo";
    } else if (!emailRegex.hasMatch(email)) {
      return "Email invalido";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return "Completar campo";
    } else if (password.length < 5 || password.length > 15) {
      return "Entre 5 y 15 caracteres";
    }
    return null;
  }

  static String? validateBirthDate(String? value) {
    RegExp regExp = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if(value != null && value.isNotEmpty) {
      if(!regExp.hasMatch(value)) {
        return 'Formato de fecha inválido';
      }
      try {
        final inputDate = DateFormat("dd/MM/yyyy").parseStrict(value);
        if (inputDate.isAfter(DateTime.now())) {
          return 'La fecha debe ser anterior a la fecha actual';
        }
      } on FormatException {
        return 'Formato de fecha inválido';
      }
    }
    return null;
  }

  static String? validatePhoneNumber(String? phone) {
    final RegExp emailRegex = RegExp(r'^\+54\d{10}$');
    if (phone!.isNotEmpty && !emailRegex.hasMatch(phone)) {
      return "Numero invalido. Ej: +54 11 4444 4444";
    }
    return null;
  }

  static String? validateContactEmail(String? email) {
    final RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+");
    if (email!.isNotEmpty && !emailRegex.hasMatch(email)) {
      return "Email invalido";
    }
    return null;
  }
}
