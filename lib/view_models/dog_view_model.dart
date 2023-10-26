import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import '../models/breeds_list_model.dart';

final viewModel =
    ChangeNotifierProvider.autoDispose<ViewModel>((ref) => ViewModel());

class ViewModel extends ChangeNotifier {
  final dio = Dio();
  Logger logger = Logger();
  List<BreedsListModel> breedsList = [];

  //All Breeds
  Future<void> fetchBreeds() async {
    final response = await Dio().get('https://dog.ceo/api/breeds/list/all');
    final data = response.data['message'];
    breedsList.clear();
    data.forEach((name, subBreeds) {
      breedsList.add(BreedsListModel(name: name, subBreeds: List<String>.from(subBreeds)));
    });
    notifyListeners();
    logger.d(breedsList.length);
  }
// Random Image by Breed Screen

  String? randomImageUrl;
  String? selectedBreed;

  void setSelectedBreed(String breed) {
    selectedBreed = breed;
    notifyListeners();
  }
  Future<void> fetchRandomImageByBreed(String breed) async {
    final response = await Dio().get('https://dog.ceo/api/breed/$breed/images/random');
    randomImageUrl = response.data['message'];
    notifyListeners();
  }
}
