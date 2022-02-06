import '../../lib/src/view_models/exceptions/exceptions.dart';
import '../../lib/src/data_source/api.dart';
import '../../lib/src/domain/entities/entities.dart';
import '../../lib/src/domain/value_objects/email.dart';

class FakeUserRepository extends UserRepository {
  final dynamic error;
  FakeUserRepository({this.error});

  @override
  Future<void> init() async {}

  @override
  Future<User> signIn(int? userId) async {
    if (userId == null) {
      throw NullNumberException();
    }
    await Future.delayed(Duration(seconds: 1));
    if (error != null) {
      throw error;
    }

    return User(id: userId, name: 'fakeName', username: 'fakeUserName');
  }

  @override
  Future<User> signUp(int? userId) {
    // TODO: implemet signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut(int? param) {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  void dispose() {}
}

class FakeRecipeRepository implements RecipeRepository {
  final dynamic error;
  FakeRecipeRepository({this.error});

  @override
  Future<List<Recipe>> read([RecipeParam? param]) async {
    if (param == null) {
      throw NullNumberException();
    }
    await Future.delayed(Duration(seconds: 1));

    if (error != null) {
      throw error;
    }

    return [
      Recipe(
        id: 1,
        title: 'Recipe1 title',
        body: 'Recipe1 body',
        userId: 1,
        calories: 23,
      ),
      Recipe(
        id: 2,
        title: 'Recipe2 title',
        body: 'Recipe2 body',
        userId: 2,
        calories: 54,
      ),
      Recipe(
        id: 3,
        title: 'Recipe3 title',
        body: 'Recipe3 body',
        userId: 3,
        calories: 500,
      ),
    ];
  }

  @override
  Future<Recipe> create(Recipe item, RecipeParam? param) {
    throw UnimplementedError();
  }

  @override
  Future delete(List<Recipe> items, RecipeParam? param) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future update(List<Recipe> items, RecipeParam? param) {
    // TODO: Implement
    throw UnimplementedError();
  }

  @override
  Future<void> init() async {}

  @override
  void dispose() {}

  @override
  Future<int> count(RecipeParam param) async {
    return 3;
  }
}

class FakeIngredientRpository implements IngredientRepository {
  final dynamic error;

  FakeIngredientRpository({this.error});

  @override
  Future<void> init() async {}

  @override
  Future<List<Ingredient>> read([int? recipeId]) async {
    if (recipeId == null) {
      throw NullNumberException();
    }
    await Future.delayed(Duration(seconds: 1));

    if (error != null) {
      throw error;
    }
    return [
      Ingredient(
          id: 1,
          name: 'FakeIngredientName1',
          amount: 2,
          body: 'FakeIngredientBody1',
          location: 'Pantry',
          recipeId: recipeId),
      Ingredient(
          id: 2,
          name: 'FakeIngredientName2',
          amount: 10,
          body: 'FakeIngredientBody2',
          location: 'Fridge',
          recipeId: recipeId),
      Ingredient(
          id: 3,
          name: 'FakeIngredientName3',
          amount: 5,
          body: 'FakeIngredientBody3',
          location: 'Pantry',
          recipeId: recipeId),
    ];
  }

  @override
  Future<Ingredient> create(Ingredient item, param) {
    // TODO: Implement
    throw UnimplementedError();
  }

  @override
  Future delete(List<Ingredient> items, int? param) {
    // TODO: Implement
    throw UnimplementedError();
  }

  @override
  Future update(List<Ingredient> tiems, int? param) {
    // TODO: Implement
    throw UnimplementedError();
  }

  @override
  void dispose() {}
}
