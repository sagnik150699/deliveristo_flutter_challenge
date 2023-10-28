
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/custom_text_widgets.dart';
import '../components/image_widget.dart';
import '../view_models/view_model.dart';

class RandomImageByBreed extends ConsumerWidget {
  const RandomImageByBreed({super.key});

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
            text: "RANDOM IMAGE BY BREED", fontSize: 25.0),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
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
                  viewModelProvider.fetchRandomImageByBreed(value);
                }
              },
            ),
            const SizedBox(height: 20.0),
            // Display random image
            if (viewModelProvider.randomImageUrl != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ImageWidget(
                  key: const ValueKey('dogImage'),
                  url: viewModelProvider.randomImageUrl!,

                ),
              ),
          ],
        ),
      ),
    );
  }
}
