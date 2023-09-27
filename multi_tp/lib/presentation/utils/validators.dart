

class Validators {
  static String? validateEmail(String? email) {
    final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+");
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
    } else if (password.length > 8 && password.length < 15) {
      return "Entre 8 y 15 caracteres";
    }
    return null;
  }
}