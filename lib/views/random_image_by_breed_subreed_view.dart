import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/custom_text_widgets.dart';
import '../view_models/view_model.dart';

class RandomImageBreedSubreed extends ConsumerWidget {
  const RandomImageBreedSubreed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            viewModelProvider.clearSelectedBreedData();
            Navigator.pop(context);
          },
        ),
        title: const LuckiestGuyFont(
            text: "random image by breed and sub breed", fontSize: 25.0),
      ),
      body: Column(
        children: [
          // Dropdown to select breed
          DropdownButton<String>(
            value: viewModelProvider.selectedBreed,
            hint: Text('Select Breed'),
            items: viewModelProvider.breedsList.map((breed) {
              return DropdownMenuItem<String>(
                value: breed.breed,
                child: Text(breed.breed),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                viewModelProvider.setSelectedBreed(value);
                viewModelProvider
                    .clearSelectedBreedData(); // Clear previous data
              }
            },
          ),

          // Dropdown to select sub-breed (visible only if sub-breeds are available)
          if (viewModelProvider.selectedBreed != null &&
              viewModelProvider.breedsList
                  .firstWhere(
                      (breed) => breed.breed == viewModelProvider.selectedBreed)
                  .subBreeds
                  .isNotEmpty)
            DropdownButton<String>(
              value: viewModelProvider.selectedSubBreed,
              hint: Text('Select Sub-Breed'),
              items: viewModelProvider.breedsList
                  .firstWhere(
                      (breed) => breed.breed == viewModelProvider.selectedBreed)
                  .subBreeds
                  .map((subBreed) {
                return DropdownMenuItem<String>(
                  value: subBreed,
                  child: Text(subBreed),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  viewModelProvider.setSelectedSubBreed(value);
                  viewModelProvider.fetchRandomImageByBreedAndSubBreed(
                      viewModelProvider.selectedBreed!, value);
                }
              },
            ),
          // Display random image
          if (viewModelProvider.randomImageUrl != null)
            Image.network(viewModelProvider.randomImageUrl!),
        ],
      ),
    );
  }
}
