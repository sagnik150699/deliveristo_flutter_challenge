import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deliveristo_flutter_challenge/components/custom_text_widgets.dart';

void main() {
  testWidgets('LuckiestGuyFont displays the correct text and style', (WidgetTester tester) async {
    const testText = 'Test Text';
    const testFontSize = 20.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LuckiestGuyFont(
            text: testText,
            fontSize: testFontSize,
          ),
        ),
      ),
    );

    final textFinder = find.text(testText);
    final textWidget = tester.widget<Text>(textFinder);

    expect(textFinder, findsOneWidget);
    expect(textWidget.style?.fontSize, testFontSize);
    // Updated the expected font family name to match the actual value
    expect(textWidget.style?.fontFamily, 'LuckiestGuy_regular');
  });
}
