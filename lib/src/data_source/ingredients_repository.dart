part of 'api.dart';

class IngredientRepository implements ICRUD<Ingredient, int> {
  @override
  Future<List<Ingredient>> read([int? recipeId]) async {
    if (recipeId == null) {
      throw NullNumberException();
    }
    var ingredients = <Ingredient>[];

    try {
      final response = await _client.get(
        Uri.parse('$_endpoint/comments?postId=$recipeId'),
      );
      if (response.statusCode == 404) {
        throw IngredientNotFoundException(recipeId);
      }

      if (response.statusCode != 200) {
        throw NetworkErrorException();
      }

      var parsed = json.decode(response.body) as List<dynamic>;

      for (var ingredient in parsed) {
        ingredients.add(Ingredient.fromMap(ingredient));
      }

      return ingredients;
    } catch (e) {
      throw NetworkErrorException();
    }
  }

  @override
  Future<Ingredient> create(Ingredient item, int? param) {
    throw UnimplementedError();
  }

  @override
  Future delete(List<Ingredient> items, int? param) {
    throw UnimplementedError();
  }

  @override
  Future update(List<Ingredient> items, int? param) {
    throw UnimplementedError();
  }

  @override
  Future<void> init() async {}

  @override
  void dispose() {}
}
