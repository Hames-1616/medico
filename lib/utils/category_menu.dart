import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/palette.dart';

class Catwid extends StatelessWidget {
  final String image;
  final String message;
  const Catwid({super.key, required this.image,required this.message});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        
      },
      highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
      child: Stack(
        children: [
          SizedBox(
              // height: 300,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(imageUrl: image,placeholder: (context,url)=>SizedBox(
                height: 100,
                width: 100,
                child: Image.network(Photos.title)),).blurred(blur: 1.3)),
          Container(
            padding: const EdgeInsets.all(25),
            child:  Text(
              message,
              style: const TextStyle(fontFamily: "Poppins", fontSize: 22,fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
