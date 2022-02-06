// import 'package:outincook/main.dart';

import '../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_recipe_test.dart';
import 'data_source/fake_recipe_repository.dart';

void main() {
  setUp(() {
    recipes.injectCRUDMock(() => FakeRecipeRepository());
  });

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
}
