class ValidatorFunction {
  // ==========
  // Login
  // ==========

  // Email validate
  static String? validatorEmail(val) {
    return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(val!)
        ? null
        : "Please enter a valid email";
  }

// Password validate
  static String? validatorPassword(val) {
    if (val!.length < 4) {
      return "Password must be 4 character";
    }
    return null;
  }

  // ==========
  // SignUp
  // ==========

  // Email validate
  static String? validatorEmailSignUp(val) {
    return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(val!)
        ? null
        : "Please enter a valid email";
  }

  // Password validate
  static String? validatorPasswordSignUp(val) {
    if (val!.length < 4) {
      return "Password must be 4 character";
    }
    return null;
  }

  // Cofirm password validate
  static String? validatorCfPasswordSignUp(val) {
    if (val!.length < 4) {
      return "Password must be 4 character";
    }
    return null;
  }
}
