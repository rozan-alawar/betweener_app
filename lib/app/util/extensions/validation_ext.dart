extension ValidationExt on String {
  String? get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (isEmpty) {
      return ("Email is required");
    } else if (!emailRegExp.hasMatch(this)) {
      return ("Enter valid email");
    } else {
      return null;
    }
  }

  String? get isValidPassword {
    if (isEmpty) {
      return ("Password is required");
    } else if (length < 8) {
      return ("Password Must be more than 8 characters");
    } else {
      return null;
    }
  }

  String? get isValidName {
    if (isEmpty) {
      return ("Name is required");
    } else {
      return null;
    }
  }
}
