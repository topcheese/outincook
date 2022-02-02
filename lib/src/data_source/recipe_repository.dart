part of 'api.dart';

class RecipeRepository implements ICRUD<Recipe, int> {
  @override
  Future<List<Recipe>> read([int? userId]) async {
    if (userId == null) {
      throw NullNumberException();
    }
    var recipes = <Recipe>[];

    try {
      final response = await _client.get(
        Uri.parse('$_endpoint/posts?userId=$userId'),
      );
      if (response.statusCode == 404) {
        throw RecipeNotFoundException(userId);
      }

      if (response.statusCode != 200) {
        throw NetworkErrorException();
      }

      var parsed = json.decode(response.body) as List<dynamic>;

      for (var recipe in parsed) {
        recipes.add(Recipe.fromMap(recipe));
      }
      return recipes;
    } catch (e) {
      throw NetworkErrorException();
    }
  }

  @override
  Future<Recipe> create(Recipe item, int? param) {
    throw UnimplementedError();
  }

  @override
  Future delete(List<Recipe> items, int? param) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future update(List<Recipe> items, int? param) {
    throw UnimplementedError();
  }

  @override
  Future<void> init() async {}
  @override
  void dispose() {}
}
