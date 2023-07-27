
import 'package:flutter/material.dart';
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
              Catwid(image: "https://images.unsplash.com/photo-1544829885-9a58b457fd5a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fHZpdGFtaW5zfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60", message: "Vitamins",),
              SizedBox(height: 20,),
               Catwid(image: "https://media.istockphoto.com/id/1184019335/photo/measuring-blood-sugar.jpg?s=612x612&w=0&k=20&c=Q4ytB6wMpaPqodqr8P_ynVC-qcXx-uXOZj8ZtSnN6YM=",message: "Diabetes Devices",),
               SizedBox(height: 20,),
               Catwid(image: "https://images.unsplash.com/photo-1492552181161-62217fc3076d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGF5dXJ2ZWRhfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",message: "Aryuveda Products",),
               SizedBox(height: 20,),
               Catwid(image: "https://media.istockphoto.com/id/466628811/photo/alternative-medicine.jpg?s=612x612&w=0&k=20&c=xGUFtYeRC8SuOPLkt9XxmKN85RlMkqDy7toQJWt1YEM=",message: "HomeoPathy",),
            ],
          ),
        ),
      ),
    );
  }
}