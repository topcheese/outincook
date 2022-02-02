import 'dart:convert';

// import '../value_objects/email.dart';

class Ingredient {
  final int id;
  final int recipeId;
  final int amount;
  final String body;
  final String name;
  final String location;

  Ingredient({
    required this.id,
    required this.recipeId,
    required this.amount,
    required this.body,
    required this.name,
    required this.location,
  });

  Ingredient copyWith({
    int? id,
    int? recipeId,
    int? amount,
    String? body,
    String? name,
    String? location,
  }) {
    return Ingredient(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      amount: amount ?? this.amount,
      body: body ?? this.body,
      name: name ?? this.name,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'recipeId': recipeId,
      'amount': amount,
      'body': body,
      'name': name,
      'location': location,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      id: map['id'],
      recipeId: map['postId'],
      name: map['name'],
      amount: map['amount'],
      body: map['body'],
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) =>
      Ingredient.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ingredient(id: $id, recipedId: $recipeId, name: $name, body: $body)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Ingredient &&
        o.id == id &&
        o.recipeId == recipeId &&
        o.amount == amount &&
        o.name == name &&
        o.body == body &&
        o.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        recipeId.hashCode ^
        amount.hashCode ^
        location.hashCode ^
        body.hashCode;
  }
}
