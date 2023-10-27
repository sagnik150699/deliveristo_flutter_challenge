class BreedsListModel {
  final String breed;
  final List<String> subBreeds;

  BreedsListModel({required this.breed, required this.subBreeds});

  factory BreedsListModel.fromJson(String breed, List<dynamic> subBreeds) {
    return BreedsListModel(
      breed: breed,
      subBreeds: List<String>.from(subBreeds),
    );
  }
}
