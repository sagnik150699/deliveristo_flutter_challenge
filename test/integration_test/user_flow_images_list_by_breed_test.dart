import 'package:deliveristo_flutter_challenge/views/image_list_by_breed_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:deliveristo_flutter_challenge/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Show image list by breed user flow', (WidgetTester tester) async {

    app.main();
    await tester.pumpAndSettle();

    // Tap the button to navigate to the breed selection page
    final Finder breedListButtonFinder =
    find.widgetWithText(MaterialButton, 'Images List by Breed');
    await tester.tap(breedListButtonFinder);
    await tester.pumpAndSettle();

    // Check if the ImageListByBreedView is displayed
    expect(find.byType(ImageListByBreedView), findsOneWidget);

    // Select the Second Breed from Dropdown
    final Finder dropdownFinder = find.byKey(const ValueKey('breedDropdown'));
    await tester.tap(dropdownFinder);
    await tester.pumpAndSettle(); // Wait for the dropdown options to appear

    await tester.tap(find.byKey(const ValueKey('breedItem')).first);

    await tester.pumpAndSettle(const Duration(seconds: 5));


    // Verify list of images
    expect(find.byType(Image), findsWidgets);
  });
}
