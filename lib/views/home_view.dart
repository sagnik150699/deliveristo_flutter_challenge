import 'package:deliveristo_flutter_challenge/components/custom_text_widgets.dart';
import 'package:deliveristo_flutter_challenge/components/home_button_navigation.dart';
import 'package:deliveristo_flutter_challenge/view_models/dog_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'random_image_by_breed_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);
    if (viewModelProvider.breedsList.isEmpty) {
      viewModelProvider.fetchBreedsList();
      return const SpinKitWaveSpinner(
        color: Colors.greenAccent,
        waveColor: Color(0xff9DD8A9),
        size: 150.0,
      );
    }
    else {
      return const Scaffold(
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LuckiestGuyFont(text: "Home", fontSize: 80.0),
              SizedBox(height: 70.0),
              HomeButtonNavigation(
                buttonText: "RANDOM IMAGE BY BREED",
                navigator: RandomImageByBreed(),
              ),

              HomeButtonNavigation(
                buttonText: "Images List by Breed",
                navigator: RandomImageByBreed(),
              ),
              HomeButtonNavigation(
                buttonText: "Random Image by Breed & Sub-Breed",
                navigator: RandomImageByBreed(),
              ),
              HomeButtonNavigation(
                buttonText: "Images List by Breed & Sub-Breed",
                navigator: RandomImageByBreed(),
              ),
            ],
          ),
        ]),
      );
    }

  }
}
