import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.q=false,
    this.c = "",
    this.p = "",
    this.a = 20,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.keyboardType,
    required this.onChanged,
    required this.con,
    Key? key,
  }) : super(key: key);
  bool q;
  int a;
  final String c;
  final String p;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final TextEditingController con;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0,),
      child: TextFormField(
        validator: (value) {
        },
        autofocus: q,
        controller: con,
        maxLength: a,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontFamily: "Poppins",
          color: Colors.black54,
          fontWeight: FontWeight.w600,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          counterText: "",
          contentPadding: const EdgeInsets.all(18.0),
          filled: true,
          fillColor: Colors.grey.shade300,
          prefixIcon: Icon( 
            icon,
            size: 24.0,
            color: Colors.black54,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: "Poppins",
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}