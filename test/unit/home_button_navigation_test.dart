import 'package:deliveristo_flutter_challenge/components/home_button_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('HomeButtonNavigation has a button with text', (WidgetTester tester) async {
    const testButtonText = 'Test Button';
    await tester.pumpWidget(MaterialApp(home: HomeButtonNavigation(buttonText: testButtonText, navigator: Container())));

    expect(find.byType(MaterialButton), findsOneWidget);
    expect(find.text(testButtonText), findsOneWidget);
  });
}
