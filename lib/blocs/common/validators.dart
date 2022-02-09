import '../../ui/localization/localization.dart';
// import '/ui/localization/localization.dart';

class Validators {
  static String? emailValidation(String? email) {
    if (!_emailRegExp.hasMatch(email!)) {
      return i18n.state.enterValidEmail;
    }
  }

  static String? passwordValidation(String? password) {
    if (!_passwordRegExp.hasMatch(password!)) {
      return i18n.state.enterValidPassword;
    }
  }

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
}
