import 'package:deliveristo_flutter_challenge/components/custom_text_widgets.dart';
import 'package:deliveristo_flutter_challenge/components/home_button_navigation.dart';
import 'package:deliveristo_flutter_challenge/view_models/view_model.dart';
import 'package:deliveristo_flutter_challenge/views/image_list_by_breed_subreed_view.dart';
import 'package:deliveristo_flutter_challenge/views/random_image_by_breed_subreed_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'image_list_by_breed_view.dart';
import 'random_image_by_breed_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);
    if (viewModelProvider.breedsList.isEmpty) {
      viewModelProvider.fetchBreeds();
      return const SpinKitWaveSpinner(
        color: Colors.greenAccent,
        waveColor: Color(0xff9DD8A9),
        size: 150.0,
      );
    } else {
      return const Scaffold(
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LuckiestGuyFont(text: "Home", fontSize: 80.0),
              SizedBox(height: 70.0),
              HomeButtonNavigation(
                key: ValueKey("RANDOM IMAGE BY BREED"),
                buttonText: "RANDOM IMAGE BY BREED",
                navigator: RandomImageByBreed(),
              ),
              HomeButtonNavigation(
                buttonText: "Images List by Breed",
                navigator: ImageListByBreedView(),
              ),
              HomeButtonNavigation(
                buttonText: "Random Image by Breed & Sub-Breed",
                navigator: RandomImageBreedSubreed(),
              ),
              HomeButtonNavigation(
                buttonText: "Images List by Breed & Sub-Breed",
                navigator: ImagesListByBreedAndSubBreed(),
              ),
            ],
          ),
        ]),
      );
    }
  }
}
