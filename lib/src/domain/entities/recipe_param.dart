class RecipeParam {
  final int? id;
  final String? userId;
  final String? title;
  RecipeParam({
    this.id,
    this.userId,
    this.title,
  });

  RecipeParam copyWith({
    int? id,
    String? userId,
    String? title,
  }) {
    return RecipeParam(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
    );
  }
}
