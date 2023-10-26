class BreedsListModel {
  final String breed;
  final List<String> subBreeds;

  BreedsListModel({required this.breed, required this.subBreeds});

  factory BreedsListModel.fromJson(MapEntry<String, dynamic> json) {
    return BreedsListModel(
      breed: json.key,
      subBreeds: List<String>.from(json.value),
    );
  }
}
