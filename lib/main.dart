import 'package:flutter/material.dart';
//import 'package:outincook/src/data_source/api.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import './src/data_source/data_source.dart';
import 'src/ui/pages/login_page.dart';
import 'src/ui/pages/pages.dart';
import 'src/domain/entities/entities.dart';
import 'src/ui/pages/recipes/recipes_page.dart';

enum DBEnv { fake, hive, sembast, sharedPrefrences }

late DBEnv dbEnv;

final localStore = RM.inject(
  () => {
    DBEnv.sharedPrefrences: SharedPreferencesStore(),
  }[dbEnv]!,
);

final recipes = RM.injectCRUD<Recipe, RecipeParam>(() => RecipeRepository(),
    param: () => RecipeParam(id: 1, userId: '2', title: 'Fake Recipe'),
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
      onResult: (_) {},
    ));

final navigator = RM.injectNavigator(
  transitionsBuilder: RM.transitions.upToBottom(),
  routes: {
    '/': (data) => LoginPage(),
    '/home': (data) => HomePage(),
    '/recipes': (data) => RecipesPage(),
    '/ingredients': (data) => IngredientsPage(recipe: data.arguments as Recipe),
    '/addedit': (data) => AddEditPage(),
  },
);

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OutInCook Demo',
      theme: ThemeData(),
      routeInformationParser: navigator.routeInformationParser,
      routerDelegate: navigator.routerDelegate,
    );
  }
}
