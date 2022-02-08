import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:outincook/src/ui/pages/home_page.dart';
import 'package:outincook/src/view_models/recipes_vm.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import '../localization/localization.dart';

import '../../domain/entities/entities.dart';
import '../../data_source/api.dart';

final recipes = RM.injectCRUD<Recipe, RecipeParam>(
  () => RecipeRepository(),
  param: () => RecipeParam(id: 1, userId: '2', title: 'Mock Recipe 1'),
  readOnInitialization: true,
  debugPrintWhenNotifiedPreMessage: '',
  onCRUDSideEffects: OnCRUDSideEffects(
      onWaiting: null,
      onError: (err, refresh) {
        RM.scaffold.showSnackBar(
          SnackBar(
            content: OutlinedButton.icon(
              key: Key('Icons.refresh'),
              onPressed: refresh,
              icon: Icon(Icons.refresh),
              label: Text('$err'),
            ),
          ),
        );
      },
      onResult: (_) => count.refresh()),
);

final Injected<List<int>> count = RM.injectFuture<List<int>>(() async {
  final repo = recipes.getRepoAs<RecipeRepository>();
  return [];
});

final _recipe = RM.injectTextEditing(text: '', validators: [
  (val) {
    if (val!.trim().isEmpty) {
      //return i18n.of(RM.context!).emptyRecipeError;
    }
  }
]);

final _form = RM.injectForm();

class AddEditPage extends StatelessWidget {
  const AddEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipe = recipesVM.recipesRM.item(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('OutInCook'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: OnFormBuilder(
          listenTo: _form,
          builder: () {
            return ListView(
              children: [
                TextField(
                  key: Key('__TaskField'),
                  controller: _recipe.controllerWithInitialText(
                    recipe != null ? recipe.state.title : '',
                  ),
                  // autofocus: isEditing ? false : true,
                  style: Theme.of(context).textTheme.headline5,
                  // decoration: InputDecoration(hintText: _i18n.newRecipeHint),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
