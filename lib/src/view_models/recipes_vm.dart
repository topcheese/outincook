import '../view_models/view_models.dart';
import '../data_source/api.dart';
import '../domain/entities/entities.dart';
import '../ui/exceptions/exception_handler.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flutter/foundation.dart';

@immutable
class RecipesVM {
  final recipesRM = RM.injectCRUD(
    () => RecipeRepository(),
    param: () => userVM.user?.id,
    readOnInitialization: true,
    sideEffects: SideEffects<List<Recipe>>.onError(
      (err, refresh) => ExceptionHandler.showErrorDialog(err),
    ),
  );
  List<Recipe> get recipes => recipesRM.state;
  int getRecipeLikes(recipeId) {
    return recipes.firstWhere((recipe) => recipe.id == recipeId).likes;
  }

  void incrementLikes(int recipeId) {
    recipesRM.setState(
      (state) {
        recipes.firstWhere((recipe) => recipe.id == recipeId).incrementLikes();
      },
    );
  }
}

final recipesVM = RecipesVM();
