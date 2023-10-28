import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:deliveristo_flutter_challenge/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('User Flow Tests Random image by breed', () {
    testWidgets('Fetch and display random dog image by breed', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Find and tap the button to navigate to the "Random Image by Breed" page
      final Finder randomImageButton = find.byKey(const ValueKey('RANDOM IMAGE BY BREED'));
      await tester.tap(randomImageButton);
      await tester.pumpAndSettle();



      // Interact with the dropdown to select a breed

      final Finder breedDropdown = find.byKey(const ValueKey('breedDropdown'));
      await tester.tap(breedDropdown);
      await tester.pumpAndSettle();

// Select breedItem
      await tester.tap(find.byKey(const ValueKey('breedItem')).first);
      await tester.pumpAndSettle(); // Wait  to load
      await tester.pumpAndSettle(const Duration(seconds: 5));
      // Check if the image appears

      final Finder dogImageFinder = find.byKey(const ValueKey('dogImage'));
      expect(dogImageFinder, findsOneWidget);
    });
  });
}
