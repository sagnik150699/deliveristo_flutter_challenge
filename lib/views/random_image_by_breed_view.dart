import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/custom_text_widgets.dart';
import '../view_models/dog_view_model.dart';

class RandomImageByBreed extends ConsumerWidget {
  const RandomImageByBreed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const LuckiestGuyFont(
            text: "RANDOM IMAGE BY BREED", fontSize: 25.0),
      ),
     body: Center(
       child: Column(

          children: [

            DropdownButton<String>(
              dropdownColor: Colors.tealAccent,
              value: viewModelProvider.selectedBreed,
              hint: Text('Select Breed'),
              items: viewModelProvider.breedsList.map((breed) {
                return DropdownMenuItem<String>(
                  value: breed.name,
                  child: Text(breed.name),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  viewModelProvider.setSelectedBreed(value);
                  viewModelProvider.fetchRandomImageByBreed(value);
                }
              },
            ),
            // Display random image
            if (viewModelProvider.randomImageUrl != null)
              Image.network(viewModelProvider.randomImageUrl!),
          ],
        ),
     ),
    );
  }
}
