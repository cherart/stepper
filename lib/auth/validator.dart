class Validator {
  static String validateName(String value) {
    if (value.length < 5) {
      return 'Name minimum 5 characters';
    } else if (value.replaceAll(' ', '').length == 0) {
      return 'Name can\'t consist only of spaces';
    } else {
      return null;
    }
  }

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  static String validatePassword(String value) {
    if (value.length < 6) {
      return 'Password minimum 6 characters';
    } else if (value.contains(' ')) {
      return "Password can't contain spaces";
    } else {
      return null;
    }
  }
}
