import '../../../lib/src/view_models/exceptions/exceptions.dart';
import '../../../lib/src/view_models/view_models.dart';
import '../../../lib/src/domain/entities/entities.dart';
import '../../../lib/src/ui/pages/recipes/recipes_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../data_source/fake_api.dart';

void main() {
  final Widget recipesPage = TopAppWidget(
    builder: (_) => MaterialApp(
      initialRoute: '/recipes',
      routes: {
        '/recipes': (_) => RecipesPage(),
        '/ingredients': (context) {
          return Scaffold(
              body: Text('This is recipe detail page is displayed'));
        },
      },
      navigatorKey: RM.navigate.navigatorKey,
    ),
  );

  setUp(() {
    userVM.userRM.injectMock(
      () => User(id: 1, name: 'fakeName', username: 'fakeUserName'),
    );

    recipesVM.recipesRM.injectCRUDMock(
      () => FakeRecipeRepository(),
    );
  });

  testWidgets(
      'display CircularProgressIndicator at atartup ad show error dialong on NetoworkErrorExeption',
      (tester) async {
    recipesVM.recipesRM.injectCRUDMock(
      () => FakeRecipeRepository(
        error: NetworkErrorException(),
      ),
    );

    // await tester.pumpWidget(recipesPage);

    // Expect to see a CircularProgressIndicator
    // expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // final String errorMessage = NetworkErrorException().message;

    //await tester.pump(Duration(seconds: 1));
    // Expect to see AlertDialog
    // expect(find.byType(AlertDialog), findsOneWidget);
    // Expect to see 'A Network problem' message
    // expect(find.text(errorMessage), findsOneWidget);

    await tester.pumpAndSettle();
  });

  testWidgets(
      'display CircularProgressIndicator at startup and show error dialong on RecipeNotFoundException',
      (tester) async {
    recipesVM.recipesRM.injectCRUDMock(() => FakeRecipeRepository(
          error: RecipeNotFoundException(1),
        ));

    // await tester.pumpWidget(recipesPage);

    // Expect to se a CircularProgressIndicator
    // expect(find.byType(CircularProgressIndicator), findsOneWidget);

    //final String errorMessage = RecipeNotFoundException(1).message;

    //await tester.pump(Duration(seconds: 1));
    // Expect Alert dialog
    //expect(find.byType(AlertDialog), findsOneWidget);
    // Expect Network problem
    //expect(find.text(errorMessage), findsOneWidget);
  });
}
