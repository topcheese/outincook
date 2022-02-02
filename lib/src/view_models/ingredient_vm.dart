import '../data_source/api.dart';
import 'package:flutter/foundation.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

@immutable
class IngredientsVM {
  final ingredientsRM = RM.injectCRUD(
    () => IngredientRepository(),
  );

  void read(int recipeId) {
    ingredientsRM.crud.read(param: (_) => recipeId);
  }
}

final ingredientsVM = IngredientsVM();
