import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  const ImageWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 30.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.tealAccent),
          ),
          shadowColor: Colors.tealAccent,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  url,
                  height: 250.0,
                  width: 300.0,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
