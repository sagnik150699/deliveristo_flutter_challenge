import 'package:deliveristo_flutter_challenge/components/image_widget.dart';
import 'package:deliveristo_flutter_challenge/view_models/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/custom_text_widgets.dart';

class ImageListByBreedView extends ConsumerWidget {
  const ImageListByBreedView({super.key});

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
        title: const LuckiestGuyFont(text: "List by breed", fontSize: 25.0),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          // Dropdown to select breed
          DropdownButton<String>(
            key: const ValueKey('breedDropdown'),
            value: viewModelProvider.selectedBreed,
            hint: const LuckiestGuyFont(text: 'Select Breed', fontSize: 15.0),
            items: viewModelProvider.breedsList.map((breed) {
              return DropdownMenuItem<String>(
                key: const ValueKey('breedItem'),
                value: breed.breed,
                child: LuckiestGuyFont(text: breed.breed, fontSize: 15.0),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                viewModelProvider.setSelectedBreed(value);
                viewModelProvider.fetchImagesByBreed(value);
              }
            },
          ),
          const SizedBox(height: 20.0),
          // Display images list
          Expanded(
            child: ListView.builder(
              itemCount: viewModelProvider.breedImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: ImageWidget(url: viewModelProvider.breedImages[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
