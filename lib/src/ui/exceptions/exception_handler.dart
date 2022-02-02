import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../domain/exceptions/validation_exception.dart';
import '../../view_models/exceptions/exceptions.dart';

class ExceptionHandler {
  // go through all custom errors and return the corresponding error message
  static String errorMessage(dynamic error) {
    if (error == null) {
      return '';
    }
    if (error is ValidationException) {
      return error.message;
    }

    if (error is NotNumberException) {
      return error.message;
    }

    if (error is NotInRangeException) {
      return error.message;
    }

    if (error is NetworkErrorException) {
      return error.message;
    }

    if (error is UserNotFoundException) {
      return error.message;
    }

    if (error is RecipeNotFoundException) {
      return error.message;
    }

    if (error is IngredientNotFoundException) {
      return error.message;
    }

    // throw unexpected error
    throw error;
  }

  // Display an AlertDialog with the error message
  static void showErrorDialog(dynamic error) {
    if (error == null) {
      return;
    }

    RM.navigate.toDialog(
      AlertDialog(
        content: Text(errorMessage(error)),
      ),
    );
  }

  // Display a snackbar with the error message
  static void showSnackBar(dynamic error) {
    if (error == null) {
      return;
    }
    RM.scaffold.showSnackBar(
      SnackBar(
        content: Text('${errorMessage(error)}'),
      ),
    );
  }
}
