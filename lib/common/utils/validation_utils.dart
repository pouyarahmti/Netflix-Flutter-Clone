import 'package:email_validator/email_validator.dart';

import '../services/logger_service.dart';

class ValidationUtils {
  static final ValidationUtils _instance = ValidationUtils._internal();

  factory ValidationUtils() {
    return _instance;
  }

  ValidationUtils._internal() {
    LoggerService().simple("VALIDATION UTILS INITIALIZED");
  }

  // EMPTY STRING VALIDATOR
  String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cannot be empty";
    }
    return null;
  }

  // EMAIL VALIDATOR
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cannot be empty";
    }
    if (!EmailValidator.validate(value)) {
      return "Please enter valid email";
    }
    return null;
  }

  // PASSWORD MATCHING VALIDATOR
  String? validatePasswordMatching(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "This field cannot be empty";
    }
    if (!(value == password)) {
      return "Passwords do not match";
    }
    return null;
  }
}
