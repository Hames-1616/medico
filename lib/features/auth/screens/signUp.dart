import 'package:flutter/material.dart';
import 'package:medico/theme/palette.dart';

import '../../../utils/textfield.dart';

class SignUp extends StatelessWidget {
  static route = 
  SignUp({super.key});
  final con = TextEditingController();
  final con1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(height: 50, child: Image.network(Photos.title)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "New User?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "Sign Up To Create New Account",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
              hintText: "Email",
              icon: Icons.people,
              keyboardType: TextInputType.text,
              onChanged: (value) {},
              con: con),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
              obscureText: true,
              hintText: "Password",
              icon: Icons.password,
              keyboardType: TextInputType.text,
              onChanged: (value) {},
              con: con1),
              CustomTextField(
              obscureText: true,
              hintText: "Confirm Password",
              icon: Icons.password,
              keyboardType: TextInputType.text,
              onChanged: (value) {},
              con: con1),
          
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: IconButton(
              onPressed: () {},
              icon: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "Create Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                          color: Colors.white),
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
