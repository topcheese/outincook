part of 'ingredients_page.dart';

class _LikeButton extends StatelessWidget {
  _LikeButton({required this.recipeId});
  final int recipeId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        OnReactive(
          () => Text('Likes ${recipesVM.getRecipeLikes(recipeId)}'),
        ),
        MaterialButton(
          color: Colors.white,
          child: Icon(Icons.thumb_up),
          onPressed: () {
            recipesVM.incrementLikes(recipeId);
          },
        )
      ],
    );
  }
}
