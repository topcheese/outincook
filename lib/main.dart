import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'src/ui/pages/login_page.dart';
import 'src/ui/pages/pages.dart';
import 'src/domain/entities/entities.dart';
import 'src/ui/pages/recipes/recipes_page.dart';

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
