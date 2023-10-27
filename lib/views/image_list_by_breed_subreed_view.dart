import 'package:deliveristo_flutter_challenge/components/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/custom_text_widgets.dart';
import '../view_models/view_model.dart';

class ImagesListByBreedAndSubBreed extends ConsumerWidget {
  const ImagesListByBreedAndSubBreed({super.key});

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
            text: "Images List by Breed & Sub-Breed", fontSize: 25.0),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Dropdown to select breed
              DropdownButton<String>(
                value: viewModelProvider.selectedBreed,
                hint:
                    const LuckiestGuyFont(text: 'Select Breed', fontSize: 15.0),
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
                hint: const LuckiestGuyFont(
                    text: 'Select Sub Breed', fontSize: 15.0),
                items: viewModelProvider.selectedBreed != null
                    ? viewModelProvider.breedsList
                        .firstWhere((breed) =>
                            breed.breed == viewModelProvider.selectedBreed)
                        .subBreeds
                        .map((subBreed) {
                        return DropdownMenuItem<String>(
                          value: subBreed,
                          child: LuckiestGuyFont(text: subBreed,fontSize: 15.0),
                        );
                      }).toList()
                    : [
                        DropdownMenuItem<String>(
                          value: 'No Sub-Breeds',
                          child: LuckiestGuyFont(
                              text: 'No Sub Breed', fontSize: 15.0),
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
                          viewModelProvider.fetchImagesByBreedAndSubBreed(
                              viewModelProvider.selectedBreed!, value);
                        }
                      }
                    : null,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          // Display images list
          Expanded(
            child: ListView.builder(
              itemCount: viewModelProvider.breedAndSubBreedImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: ImageWidget(
                      url: viewModelProvider.breedAndSubBreedImages[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
