// import 'package:outincook/src/domain/entities/entities.dart';

//import 'package:outincook/src/domain/entities/recipe_param.dart';

import '../../lib/src/domain/entities/recipe.dart';
import '../../lib/src/domain/entities/recipe_param.dart';
import '../../lib/src/data_source/api.dart';

class FakeRecipeRepository implements RecipeRepository {
  late Map<String, List<Recipe>> _recipesStore = {};
  dynamic exception;
  late int idToCreate;

  @override
  Future<void> init() async {
    await Future.delayed(Duration(seconds: 1));
    _recipesStore = {
      '1': [
        Recipe(
          id: 1,
          userId: 2,
          title: 'Fake Recipe',
          calories: 3,
        )
      ]
    };
  }

  @override
  Future<Recipe> create(Recipe recipe, RecipeParam? param) async {
    final recipeToAdd = Recipe(
      id: idToCreate,
      userId: recipe.userId,
      title: 'Fake Recipe',
      calories: 30,
    );

    return recipeToAdd;
  }

  @override
  Future<List<Recipe>> read(RecipeParam? param) async {
    final userRecipes = _recipesStore[param!.id] ?? [];

    return [...userRecipes];
  }

  @override
  Future update(List<Recipe> recipes, RecipeParam? param) async {}

  @override
  Future delete(List<Recipe> recipes, RecipeParam? param) async {}

  @override
  void dispose() {}

  @override
  Future<int> count(RecipeParam param) async {
    return 3;
  }
}
