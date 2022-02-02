import 'dart:convert';

import 'ingredient.dart';

class Recipe {
  final int id;
  final int userId;
  final calories;
  final String title;
  String? body;
  int likes = 0;
  List<Ingredient>? ingredients;

  Recipe({
    required this.id,
    required this.userId,
    required this.calories,
    required this.title,
    this.body,
    this.ingredients,
  });

  incrementLikes() {
    likes++;
  }

  Recipe copyWith({
    int? id,
    int? userId,
    int? calories,
    String? title,
    String? body,
    int? likes,
  }) {
    return Recipe(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      calories: calories ?? this.calories,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id'],
      userId: map['userId'],
      calories: map['calories'],
      title: map['title'],
      body: map['body'],
      ingredients: map['ingredients'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Recipe(id: $id, userId: $userId, title: $title, body: $body, likes: $likes)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Recipe &&
        o.id == id &&
        o.userId == userId &&
        o.calories == calories &&
        o.title == title &&
        o.body == body &&
        o.likes == likes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        calories.hashCode ^
        title.hashCode ^
        body.hashCode ^
        likes.hashCode;
  }
}
