class NetworkErrorException implements Exception {
  final message = 'A network problem';
}

class UserNotFoundException implements Exception {
  UserNotFoundException(this._userID);
  final int _userID;
  String get message => 'No user found with this number $_userID';
}

class RecipeNotFoundException implements Exception {
  RecipeNotFoundException(this._userID);
  final int _userID;
  String get message => 'No recipe found with user ID: $_userID';
}

class IngredientNotFoundException implements Exception {
  IngredientNotFoundException(this._recipeID);
  final int _recipeID;
  String get message => 'No ingredient found for recipe ID: $_recipeID';
}
