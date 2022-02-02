part of 'ingredients_page.dart';

class _Ingredients extends ReactiveStatelessWidget {
  final int recipeId;
  _Ingredients(this.recipeId);

  @override
  void didMountWidget(context) {
    ingredientsVM.read(recipeId);
  }

  @override
  void didNotifyWidget(SnapState snap) {
    snap.onOrElse(
      onError: (err, refresh) => ExceptionHandler.showErrorDialog(err),
      orElse: (_) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return ingredientsVM.ingredientsRM.onAll(
      onWaiting: () => Center(child: CircularProgressIndicator()),
      onError: (err, refrese) => Center(
        child: Text('${err.message}'),
      ),
      onData: (ingredients) {
        return Expanded(
          child: ListView(
            children: ingredients
                .map(
                  (ingredient) => _IngredientItem(ingredient),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
