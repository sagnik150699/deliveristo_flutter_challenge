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

  Future<void> fetchBreedsList() async {
    final response = await dio.get('https://dog.ceo/api/breeds/list/all');
    if (response.statusCode == 200) {
      breedsList = (response.data['message'] as Map<String, dynamic>)
          .entries
          .map((entry) => BreedsListModel.fromJson(entry))
          .toList();
      notifyListeners();
      logger.d(breedsList[0].breed[1]);
    }
  }
}
