import 'package:meter_reading_app/utils/util/email_validator.dart';

enum ValidateFailResult {
  empty,
  isNotEmpty,
  invalidPasswordNotMatch,
  invalidPasswordIsTheSame,
  invalidEmailHasAlready,
}

typedef Validator = ValidateFailResult? Function(String?);
typedef ValidatorString = String? Function(String?);

class Validators {
  static ValidatorString combine(List<ValidatorString> validators) {
    return (String? str) {
      for (final validator in validators) {
        final result = validator(str);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }

  static ValidatorString withMessage(String message, Validator validator) {
    return (String? str) {
      final result = validator(str);
      if (result != null) {
        return message;
      }
      return null;
    };
  }

  static ValidateFailResult? isValidEmail(String? value) {
    final bool isValid = EmailValidator.validate(value!);
    if (!isValid) {
      return ValidateFailResult.isNotEmpty;
    }
    return null;
  }

  static ValidateFailResult? isTextEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return ValidateFailResult.empty;
    }
    return null;
  }

  static ValidateFailResult? isEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return ValidateFailResult.empty;
    }
    return null;
  }

  static String? isNotSelectedAccountType(int? value, String message) {
    if (value == null) {
      return message;
    }
    return null;
  }

  static String? isNotAcceptedTermsAndConditions(bool? value, String message) {
    if (value == false || value == null) {
      return message;
    }
    return null;
  }

  static ValidateFailResult? isValidPhoneNumberMinLength(String? value) {
    if (value!.length < 10) {
      return ValidateFailResult.isNotEmpty;
    }
    return null;
  }

  static ValidateFailResult? isValidPhoneNumberStartsWith(String? value) {
    if (!value!.startsWith('0')) {
      return ValidateFailResult.isNotEmpty;
    }
    return null;
  }

  static ValidateFailResult? isPasswordMatch(String? value1, String? value2) {
    return value1 == value2 ? null : ValidateFailResult.invalidPasswordNotMatch;
  }

  static ValidateFailResult? isNewPasswordSameAsOldPassword(
    String value1,
    String value2,
  ) {
    return value1 == value2
        ? ValidateFailResult.invalidPasswordIsTheSame
        : null;
  }

  static ValidateFailResult? isEamilHasAlready(
    bool hasEmailAlready,
  ) {
    return hasEmailAlready ? ValidateFailResult.invalidEmailHasAlready : null;
  }

  static ValidateFailResult? isValidPasswordMinLength(String? value) {
    if (value!.length < 8) {
      return ValidateFailResult.isNotEmpty;
    }
    return null;
  }

  static ValidateFailResult? isValidUsername(String? value) {
    // อนุญาตให้ใช้เฉพาะตัวอักษร (a-z)(ก-ฮ) .- เท่านั้น
    RegExp re = RegExp(r"[^\u0E00-\u0E7Fa-zA-Z' \.\-]+");
    final bool isValid = re.hasMatch(value!);
    if (isValid) {
      return ValidateFailResult.isNotEmpty;
    }
    return null;
  }

  static ValidateFailResult? isValidPassword(String? value) {
    RegExp re = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,})");
    final bool isValid = re.hasMatch(value!);
    if (!isValid) {
      return ValidateFailResult.isNotEmpty;
    }
    return null;
  }

  static ValidateFailResult? isValidVerifyCodeMinLength(String? value) {
    if (value!.length < 6) {
      return ValidateFailResult.isNotEmpty;
    }
    return null;
  }
}
