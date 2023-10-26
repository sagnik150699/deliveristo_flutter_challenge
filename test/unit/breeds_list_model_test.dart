import 'package:deliveristo_flutter_challenge/models/breeds_list_model.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('BreedsListModel', () {
    test('fromJson returns a valid instance', () {

      final json = {
        'name': 'Labrador',
        'subBreeds': ['Yellow', 'Chocolate', 'Black']
      };


      final breed = BreedsListModel.fromJson(json);

      expect(breed.name, 'Labrador');
      expect(breed.subBreeds, ['Yellow', 'Chocolate', 'Black']);
    });

    test('fromJson handles empty subBreeds', () {

      final json = {
        'name': 'Dalmatian',
        'subBreeds': []
      };


      final breed = BreedsListModel.fromJson(json);

      expect(breed.name, 'Dalmatian');
      expect(breed.subBreeds, isEmpty);
    });
  });
}
