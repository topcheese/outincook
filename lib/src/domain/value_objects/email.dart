import 'package:flutter/foundation.dart';
import 'package:outincook/src/domain/exceptions/validation_exception.dart';

@immutable
class Email {
  Email(this.email) {
    if (!email.contains('@')) {
      throw ValidationException('Your email must contain "@"');
    }
  }

  final String email;
}
