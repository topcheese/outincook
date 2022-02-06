part of 'api.dart';

class RecipeRepository implements ICRUD<Recipe, RecipeParam> {
  late Map<String, List<Recipe>> _recipesStore = {};

  @override
  Future<List<Recipe>> read(RecipeParam? param) async {
    final userRecipes = _recipesStore[param!.id] ?? [];
    return [...userRecipes];
  }

  @override
  Future<Recipe> create(Recipe item, RecipeParam? param) {
    throw UnimplementedError();
  }

  @override
  Future delete(List<Recipe> recipes, RecipeParam? param) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future update(List<Recipe> recipes, RecipeParam? param) async {
    throw UnimplementedError();
  }

  @override
  Future<void> init() async {}

  Future<int> count(RecipeParam param) async {
    final userRecipes = await _recipesStore[param.id] ?? [];
    return userRecipes.length;
  }

  @override
  void dispose() {}
}
