import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:deliveristo_flutter_challenge/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Random image by breed/subreed flow", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Navigate to the Random Image by Breed & Sub-Breed view
    final Finder breedListButtonFinder =
    find.widgetWithText(MaterialButton, 'Random Image by Breed & Sub-Breed');
    await tester.tap(breedListButtonFinder);
    await tester.pumpAndSettle();

    // Select a breed
    final breedDropdown = find.byKey(const ValueKey('breedDropdown'));
    await tester.tap(breedDropdown);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final breedOption = find.byKey(const ValueKey('breedItem')).first;
    await tester.tap(breedOption);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Check if sub-breed dropdown is present
    final subBreedDropdown = find.byKey(const ValueKey('subBreedDropdown'));
    if (tester.any(subBreedDropdown)) {
      // If sub-breed dropdown is present, interact with it
      await tester.tap(subBreedDropdown);
      await tester.pumpAndSettle(const Duration(seconds: 5));

      final subBreedOption = find.byKey(const ValueKey('subBreedItem')).first;
      await tester.tap(subBreedOption);
      await tester.pumpAndSettle(const Duration(seconds: 5));
    }

    // Verify that an image is displayed
    final Finder dogImageFinder = find.byType(Image);
    expect(dogImageFinder, findsOneWidget);

  });
}
