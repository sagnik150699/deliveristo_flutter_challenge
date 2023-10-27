import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LuckiestGuyFont extends StatelessWidget {
  final String text;
  final double fontSize;
  const LuckiestGuyFont(
      {super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.luckiestGuy(fontSize: fontSize),
    );
  }
}
