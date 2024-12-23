String? fullNameValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your full name';
  } else if (value.length < 3) {
    return 'Full name must be at least 3 characters';
  } else if (!RegExp(r"^[a-zA-Z- ]+$").hasMatch(value)) {
    return 'Please enter a valid full name';
  }

  return null;
} // full name validator

String? emailValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your email';
  } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return 'Please enter a valid email';
  }

  return null;
} // email validator

String? passwordValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your password';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  } else if (!RegExp(r"^(?=.*[A-Z])").hasMatch(value)) {
    return 'Password must include an uppercase letter';
  } else if (!RegExp(r"^(?=.*[a-z])").hasMatch(value)) {
    return 'Password must include a lowercase letter';
  } else if (!RegExp(r"^(?=.*\d)").hasMatch(value)) {
    return 'Password must include a number';
  } else if (!RegExp(r"^(?=.*[#@$!%*?&])").hasMatch(value)) {
    return 'Password must include a special character';
  }

  return null;
  // password validator
} // password validator

String? phoneValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your phone number';
  } else if (!RegExp(r"^[0-9]{11}$").hasMatch(value)) {
    return 'Please enter a valid phone number';
  }
  return null;
  // phone validator
} // phone validator

