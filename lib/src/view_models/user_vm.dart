import 'package:flutter/foundation.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../data_source/api.dart';
import '../domain/entities/entities.dart';
import '../ui/exceptions/exception_handler.dart';
import 'common/input_parser.dart';

@immutable
class UserVM {
  final userRM = RM.injectAuth<User?, int>(
    () => UserRepository(),
    onSigned: (_) {
      // Original line
      // RM.navigate.toNamed(('/recipes'));
      RM.navigate.toNamed(('/home'));
    },
    sideEffects: SideEffects.onError(
      (err, refresh) => ExceptionHandler.showSnackBar(err),
    ),
    debugPrintWhenNotifiedPreMessage: '',
  );

  User? get user => userRM.state;

  void signIn(String text) {
    userRM.auth.signIn(
      (_) => InputParser.parse(text),
    );
  }
}

final userVM = UserVM();
