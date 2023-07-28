import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:medico/utils/dimentions.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  onTap: (){},
  child: Container(
    padding:const  EdgeInsets.only(right: 40,left: 45,top: 20,bottom: 20),
    child: Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height/hei(context, 135),
          child: CachedNetworkImage(imageUrl: "https://m.media-amazon.com/images/I/81mHKOc5NjL._AC_UF1000,1000_QL80_.jpg")),
          const SizedBox(width: 50,),
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("   Vitamins Capsules",style: TextStyle(fontFamily: "Poppins",fontSize: 16,fontWeight: FontWeight.w600),),
              const Text("   Bottle of 60 Capsules",style: TextStyle(fontFamily: "Poppins",color: Colors.black54,fontSize: 14),),
              const SizedBox(height: 7,),
              Row(
                children: [
                  const SizedBox(width: 9,),
                  RatingBarIndicator(
    rating: 0,
    itemBuilder: (context, index) => const Icon(
         Icons.star,
         color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: 25.0,
    direction: Axis.horizontal,
),
                ],
              ),
const SizedBox(height: 7,),
    const Text("   ₹500",style: TextStyle(fontFamily: "Poppins",fontSize: 17),),
  
    TextButton(onPressed: (){}, child: Container(
      alignment: Alignment.center,
      height: 40,
      width: 130,
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.black),
        borderRadius: BorderRadius.circular(5)
      ),
      child: const Text("Add to Cart",style: TextStyle(color: Colors.black,fontFamily: "Poppins"),),
      
    )),
            ],
          ),
      ],
    ),
  ),
    );
  }
}
