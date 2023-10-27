import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/custom_text_widgets.dart';
import '../components/image_widget.dart';
import '../view_models/view_model.dart';

class RandomImageBreedSubreed extends ConsumerWidget {
  const RandomImageBreedSubreed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            viewModelProvider.clearSelectedBreedData();
            Navigator.pop(context);
          },
        ),
        title: const LuckiestGuyFont(
            text: "random image by breed and sub breed", fontSize: 20.0),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Dropdown to select breed
              DropdownButton<String>(
                value: viewModelProvider.selectedBreed,
                hint:  const LuckiestGuyFont(text: 'Select Breed', fontSize: 15.0),
                items: viewModelProvider.breedsList.map((breed) {
                  return DropdownMenuItem<String>(
                    value: breed.breed,
                    child: LuckiestGuyFont(text: breed.breed, fontSize: 15.0),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    viewModelProvider.setSelectedBreed(value);
                  }
                },
              ),

              // Dropdown to select sub-breed
              DropdownButton<String>(
                value: viewModelProvider.selectedSubBreed,
                hint:  const LuckiestGuyFont(text: 'Select Sub-Breed', fontSize: 15.0),
                items: viewModelProvider.selectedBreed != null &&
                        viewModelProvider.breedsList
                            .firstWhere((breed) =>
                                breed.breed == viewModelProvider.selectedBreed)
                            .subBreeds
                            .isNotEmpty
                    ? viewModelProvider.breedsList
                        .firstWhere((breed) =>
                            breed.breed == viewModelProvider.selectedBreed)
                        .subBreeds
                        .map((subBreed) {
                        return DropdownMenuItem<String>(
                          value: subBreed,
                          child: LuckiestGuyFont(text: subBreed, fontSize: 15.0)
                        );
                      }).toList()
                    : [
                     const   DropdownMenuItem<String>(
                          value: null,
                          child: LuckiestGuyFont(text: 'No Sub-Breed', fontSize: 15.0),
                        ),
                      ],
                onChanged: viewModelProvider.selectedBreed != null &&
                        viewModelProvider.breedsList
                            .firstWhere((breed) =>
                                breed.breed == viewModelProvider.selectedBreed)
                            .subBreeds
                            .isNotEmpty
                    ? (value) {
                        if (value != null) {
                          viewModelProvider.setSelectedSubBreed(value);
                          viewModelProvider.fetchRandomImageByBreedAndSubBreed(
                              viewModelProvider.selectedBreed!, value);
                        }
                      }
                    : null,
              ),
            ],
          ),
          // Display random image
          if (viewModelProvider.randomImageUrl != null)
            ImageWidget(url: viewModelProvider.randomImageUrl!),
        ],
      ),
    );
  }
}
