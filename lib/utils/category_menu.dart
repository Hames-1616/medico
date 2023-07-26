import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class Catwid extends StatelessWidget {
  final String image;
  final String message;
  const Catwid({super.key, required this.image,required this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 270,
            width: MediaQuery.of(context).size.width,
            child: Image.network(image).blurred(blur: 1.5)),
        Container(
          padding: const EdgeInsets.all(25),
          child:  Text(
            message,
            style: const TextStyle(fontFamily: "Poppins", fontSize: 20,fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
