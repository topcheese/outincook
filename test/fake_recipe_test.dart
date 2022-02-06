// import 'package:outincook/main.dart';

import '../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/src/ui/pages/pages.dart';
import 'fake_recipe_test.dart';
import 'data_source/fake_recipe_repository.dart';

@TestOn('android')
@TestOn('ios')
@TestOn('desktop')
void main() {
  setUp(() {
    recipes.injectCRUDMock(() => FakeRecipeRepository());
  });
  setUpAll(() async {});
  tearDownAll(() async {});
  tearDown(() async {});

  group('Basic Simple Unit Test', () {
    // Use runAsync when you have calls to such things as Future.delayed in the testWidgets
    testWidgets('App starts without error.', (tester) async {
      await tester.pumpWidget(App());
      // Waiting for read
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      // expect(find.byType(TextButton), findsOneWidget);
      //
      await tester.pumpAndSettle();
      // Read successfully
      expect(find.text('Login'), findsNWidgets(2));
    });

    testWidgets('App starts with read error', (tester) async {
      final repo = recipes.getRepoAs<FakeRecipeRepository>();
      repo.exception = 'Read Error';
      await tester.pumpWidget(App());
      // Waiting for read
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      // expect(find.byIcon(Icons.circle), findsOneWidget);
      await tester.pumpAndSettle();
      // Read successfully

      // expect(find.byIcon(Icons.refresh_outlined), findsOneWidget);
      // expect(find.byType(SnackBar), findsOneWidget);
      // expect(find.byIcon(Icons.refresh), findsOneWidget); // In Snackbar
      // First failed refresh (from appBar)
    });

    testWidgets('Create item without create error', (tester) async {});

    testWidgets('Create item with error', (tester) async {});

    testWidgets('Update item without error', (tester) async {});

    testWidgets('Update item with error', (tester) async {});

    testWidgets('Delete item without update error', (tester) async {});

    testWidgets('Delete with update error', (tester) async {});
  });
  group('Login navigation Test', () {
    testWidgets('Test login navigation', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(LoginPage), findsOneWidget);
      expect(find.text('User Id'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Enter a number between 1 - 10'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);

      await tester.pumpAndSettle();

      // Testing for integer number
      await tester.tap(find.byType(TextButton));

      await tester.enterText(find.byType(EditableText), '');
      await tester.pump(Duration(milliseconds: 400));
      expect(find.text('The entered value is not a number'), findsNWidgets(2));

      // Testing for correct number

      await tester.enterText(find.byType(EditableText), '99');

      await tester.tap(find.byType(TextButton));
      // await tester.pump(Duration(milliseconds: 100));

      await tester.pumpAndSettle();

      expect(find.text('The entered value is not between 1 and 10'),
          findsNWidgets(2));
    });
  });
}
