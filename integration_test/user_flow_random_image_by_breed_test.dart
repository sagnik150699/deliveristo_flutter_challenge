import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:deliveristo_flutter_challenge/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('User Flow Tests', () {
    testWidgets('Fetch and display random dog image by breed', (WidgetTester tester) async {
      app.main(); // Start the app
      await tester.pumpAndSettle(); // Wait for the app to settle

      // Find and tap the button to navigate to the "Random Image by Breed" page
      // Replace with the actual button's finder
      final Finder randomImageButton = find.byKey(const ValueKey('RANDOM IMAGE BY BREED'));
      await tester.tap(randomImageButton);
      await tester.pumpAndSettle(); // Wait for animations and screen transitions



      // Interact with the dropdown to select a breed
      // Replace with the actual dropdown's finder
      final Finder breedDropdown = find.byKey(const ValueKey('breedDropdown'));
      await tester.tap(breedDropdown);
      await tester.pumpAndSettle();

      // Select a breed from the dropdown (example: the first breed)

      await tester.tap(find.byKey(const ValueKey('breedItem')).first);
      await tester.pumpAndSettle(); // Wait  to load
      await tester.pumpAndSettle(const Duration(seconds: 5));
      // Check if the image appears

      final Finder dogImageFinder = find.byKey(const ValueKey('dogImage'));
      expect(dogImageFinder, findsOneWidget);
    });
  });
}
