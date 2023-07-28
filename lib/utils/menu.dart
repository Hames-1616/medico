import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medico/features/category/viewScreens/Products.dart';

import '../theme/palette.dart';

class Catwid extends StatelessWidget {
  final String image;
  final String message;
  const Catwid({super.key, required this.image,required this.message});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage(cat: message)));
      },
      highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
      child: Stack(
        children: [
          SizedBox(
              
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(imageUrl: image,placeholder: (context,url)=>SizedBox(
                height: 100,
                width: 100,
                child: Image.network(Photos.title)),).blurred(blur: 1)),
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
