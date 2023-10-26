import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/custom_text_widgets.dart';

class RandomImageByBreed extends ConsumerWidget {
  const RandomImageByBreed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const LuckiestGuyFont(
            text: "RANDOM IMAGE BY BREED", fontSize: 25.0),
      ),
    );
  }
}
