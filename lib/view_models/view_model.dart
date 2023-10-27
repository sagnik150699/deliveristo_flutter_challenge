import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import '../models/breeds_list_model.dart';

final viewModel =
    ChangeNotifierProvider.autoDispose<ViewModel>((ref) => ViewModel());
Logger logger = Logger();

class ViewModel extends ChangeNotifier {
  final dio = Dio();

  List<BreedsListModel> breedsList = [];
  String? randomImageUrl;
  String? selectedBreed;
  List<String> breedImages = [];
  String? selectedSubBreed;
  List<String> breedAndSubBreedImages = [];

  void clearSelectedBreedData() {
    selectedBreed = null;
    selectedSubBreed = null;
    randomImageUrl = null;
    breedImages.clear();

    breedAndSubBreedImages.clear();
    notifyListeners();
  }

  //All Breeds

  Future<void> fetchBreeds() async {
    final response = await Dio().get('https://dog.ceo/api/breeds/list/all');
    final data = response.data['message'];
    breedsList.clear();
    data.forEach((breed, subBreeds) {
      breedsList.add(BreedsListModel.fromJson(breed, subBreeds));
      //     logger.d('Breed: $breed, Sub-Breeds: $subBreeds');
    });
    notifyListeners();
  }

// Random Image by Breed Screen

  void setSelectedBreed(String breed) {
    selectedBreed = breed;
    notifyListeners();
  }

  Future<void> fetchRandomImageByBreed(String breed) async {
    final response =
        await Dio().get('https://dog.ceo/api/breed/$breed/images/random');
    randomImageUrl = response.data['message'];
    notifyListeners();
  }

  //Image List By Breed

  Future<void> fetchImagesByBreed(String breed) async {
    final response = await Dio().get('https://dog.ceo/api/breed/$breed/images');
    logger.d("Fetch Images by Breed is being called: $response");
    breedImages = List<String>.from(response.data['message']);
    notifyListeners();
  }

  //Random image by breed and sub breed

  void setSelectedSubBreed(String subBreed) {
    selectedSubBreed = subBreed;
    notifyListeners();
  }

  Future<void> fetchRandomImageByBreedAndSubBreed(
      String breed, String subBreed) async {
    final response = await Dio()
        .get('https://dog.ceo/api/breed/$breed/$subBreed/images/random');
    randomImageUrl = response.data['message'];
    notifyListeners();
  }

  //Images list by breed and sub breed

  Future<void> fetchImagesByBreedAndSubBreed(
      String breed, String subBreed) async {
    final response =
        await Dio().get('https://dog.ceo/api/breed/$breed/$subBreed/images');
    breedAndSubBreedImages = List<String>.from(response.data['message']);
    notifyListeners();
  }
}
