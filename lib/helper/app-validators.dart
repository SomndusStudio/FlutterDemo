import 'package:email_validator/email_validator.dart';

class AppValidator {
  static String? validateEmail(String? value) {
    if (!EmailValidator.validate(value!)) {
      return "Le format de l'email est incorrect";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.length < 6) {
      return "Le mot de passe est trop court";
    }
    return null;
  }
}
