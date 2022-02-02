import '../../view_models/view_models.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../domain/entities/entities.dart';
import '../common/common.dart';
import '../exceptions/exception_handler.dart';

// All sub page widgets are part of this top page widget
part 'ingredient_item.dart';
part 'ingredients.dart';
part 'ingredients_injected.dart';
part 'like_button.dart';

class IngredientsPage extends StatelessWidget {
  IngredientsPage({required this.recipe});
  final Recipe recipe;
  final user = userVM.user!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(recipe.title, style: headerStyle),
            Text(
              'by ${user.name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(recipe.body!),
            _LikeButton(
              recipeId: recipe.id,
            ),
            _Ingredients(recipe.id)
          ],
        ),
      ),
    );
  }
}
