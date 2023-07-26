import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:medico/utils/category_menu.dart';
class two extends StatelessWidget {
  const two({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Category",style: TextStyle(fontFamily: "Poppins",fontSize: 22),),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:  const EdgeInsets.only(right: 20,left: 20),
          child: const Column(
            children: [
              Catwid(image: "https://t4.ftcdn.net/jpg/04/38/66/37/240_F_438663747_MjwVzDfUgsMMrKJ9KilPFVZ9hJAA1bFD.jpg", message: "Vitamins",),
               Catwid(image: "https://t3.ftcdn.net/jpg/00/88/69/90/240_F_88699020_zWoH3djosXrlS5oGLy7eOSqOIGyVguOV.jpg",message: "Diabetes Devices",),
               Catwid(image: "https://t3.ftcdn.net/jpg/01/34/39/58/240_F_134395874_7A55o6neh8kUW4DROLSNreIsj93rC8TA.jpg",message: "Aryuveda Products",),
               Catwid(image: "https://t4.ftcdn.net/jpg/02/72/49/51/240_F_272495123_2D9w1k3FwuWsloK4FJSZfVBVQZvTtWFl.jpg",message: "HomeoPathy",),
            ],
          ),
        ),
      ),
    );
  }
}