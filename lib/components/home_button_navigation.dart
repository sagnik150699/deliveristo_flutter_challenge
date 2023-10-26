import 'package:deliveristo_flutter_challenge/components/custom_text_widgets.dart';
import 'package:flutter/material.dart';


class HomeButtonNavigation extends StatelessWidget {
  final String buttonText;
  final Widget navigator;
  const HomeButtonNavigation({super.key, required this.buttonText, required this.navigator});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigator),
          );
        },
        elevation: 10.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        height: 70.0,

        color: Colors.tealAccent,
        child: SizedBox(
            width: 250.0,
            child: LuckiestGuyFont(text: buttonText,fontSize: 25.0,),),
      ),
    );
  }
}
