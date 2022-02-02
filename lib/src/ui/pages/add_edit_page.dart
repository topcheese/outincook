import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:outincook/src/ui/pages/home_page.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import '../localization/localization.dart';

import '../../domain/entities/entities.dart';
import '../../data_source/api.dart';

/* final recipes = RM.injectCRUD<Recipe>(
  () => RecipeRepository(),
  param: () {},
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
      onResult: (_) => {}),
); */

/* final _task = RM.injectTextEditing(text: '', validators: [
  (val) {
    if (val!.trim().isEmpty) {
      //return i18n.of(RM.context!).emptyRecipeError;
    }
  }
]); */

class AddEditPage extends StatelessWidget {
  const AddEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OutInCook'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        /* child: OnFormBuilder(
          listenTo: _form,
          builder: () {},
        ), */
      ),
    );
  }
}
