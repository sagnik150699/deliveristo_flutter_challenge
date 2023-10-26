class BreedsListModel {
  final String name;
  final List<String> subBreeds;

  BreedsListModel({required this.name, required this.subBreeds});

  factory BreedsListModel.fromJson(Map<String, dynamic> json) {
    return BreedsListModel(
      name: json['name'],
      subBreeds: List<String>.from(json['subBreeds']),
    );
  }
}
