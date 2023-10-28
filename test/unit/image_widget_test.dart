import 'package:deliveristo_flutter_challenge/components/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';


void main() {
  testWidgets('ImageWidget has an image', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      // Using the actual URL from the API
      const testUrl = 'https://images.dog.ceo/breeds/hound-blood/n02088466_10831.jpg';
      await tester.pumpWidget(MaterialApp(home: ImageWidget(url: testUrl)));

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(ImageWidget), findsOneWidget);
    });
  });
}
