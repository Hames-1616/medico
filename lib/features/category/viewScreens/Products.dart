import 'package:flutter/material.dart';
import 'package:medico/utils/ListProduct.dart';
import 'package:medico/utils/dividers.dart';

class ProductPage extends StatelessWidget {
  final String cat;

  const ProductPage({super.key,required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat,style: const TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold),),
      ),
      body:
      Container(
        margin: const EdgeInsets.only(right: 20,left: 20),
        child: const Column(
          children: [  
            ListProduct(),
            dividers(),
            ListProduct(),
            dividers(),
          ],
        ),
      ),
    );
  }
}
