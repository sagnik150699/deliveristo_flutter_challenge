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
    find.widgetWithText(MaterialButton, 'Images List by Breed & Sub-Breed');
    await tester.tap(breedListButtonFinder);
    await tester.pumpAndSettle();

    // Select a breed
    final Finder breedDropdown = find.byKey(const ValueKey('breedDropdown'));
    await tester.tap(breedDropdown);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('breedItem')).first);
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Check if sub-breed dropdown is present and has options
    final subBreedDropdown = find.byKey(const ValueKey('subBreedDropdown'));
    if (tester.any(subBreedDropdown)) {
      await tester.tap(subBreedDropdown);
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Check if there are sub-breed options available
      final subBreedOptions = find.byKey(const ValueKey('subBreedItem'));
      if (tester.any(subBreedOptions)) {
        // If sub-breed options are available, select the first one
        await tester.tap(subBreedOptions.first);
        await tester.pumpAndSettle(const Duration(seconds: 5));
      }
    }

    // Verify that an image is displayed
    expect(find.byType(Image), findsWidgets);

  });
}
