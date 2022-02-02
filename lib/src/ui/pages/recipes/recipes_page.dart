import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import '../../common/common.dart';
import '../../../view_models/view_models.dart';
import '../../../domain/entities/entities.dart';

part 'recipe_list_item.dart';

class RecipesPage extends ReactiveStatelessWidget {
  final user = userVM.user!;

  @override
  Widget build(BuildContext context) {
    print('Scaffold');
    return Scaffold(
      backgroundColor: backgroundColor,
      body: recipesVM.recipesRM.onOrElse(
        onWaiting: () => Center(child: CircularProgressIndicator()),
        orElse: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceLarge(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Welcome ${user.name}',
                style: headerStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Here are all your recipes', style: subHeaderStyle),
            ),
            UIHelper.verticalSpaceSmall(),
            Expanded(child: GetRecipesUi()),
          ],
        ),
      ),
    );
  }
}

class GetRecipesUi extends ReactiveStatelessWidget {
  const GetRecipesUi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: recipesVM.recipes.length,
        itemBuilder: (context, index) => _RecipeListItem(
          recipe: recipesVM.recipes[index],
        ),
      );
}
