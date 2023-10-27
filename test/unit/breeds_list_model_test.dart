import 'package:deliveristo_flutter_challenge/models/breeds_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BreedsListModel', () {
    test('fromJson returns a valid instance', () {
      final breedName = 'Labrador';
      final subBreeds = ['Australian', 'Spaniard', 'Ghonta'];

      final breed = BreedsListModel.fromJson(breedName, subBreeds);

      expect(breed.breed, 'Labrador');
      expect(breed.subBreeds, ['Australian', 'Spaniard', 'Ghonta']);
    });

    test('fromJson handles empty subBreeds', () {
      final breedName = 'Dalmatian';
      final subBreeds = [];

      final breed = BreedsListModel.fromJson(breedName, subBreeds);

      expect(breed.breed, 'Dalmatian');
      expect(breed.subBreeds, isEmpty);
    });
  });
}
