class Validator {
  static List<String>? validateUsername(String username) {
    List<String> errors = [];
    if (username.length <= 6) {
      errors.add('Username phải nhiều hơn 6 kí tự');
    }
    if (!isEmail(username)) {
      errors.add('Username không hợp lệ');
    }
    return errors.isEmpty ? null : errors;
  }

  static List<String>? validatePassword(String password) {
    List<String> errors = [];
    if (password.length <= 6) {
      errors.add('Password phải nhiều hơn 6 kí tự');
    }
    return errors.isEmpty ? null : errors;
  }

  static bool isEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }
}
