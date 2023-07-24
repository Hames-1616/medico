import 'package:flutter/material.dart';
import 'package:medico/features/auth/home_screens/home_screen.dart';
import 'package:medico/features/auth/screens/signUp.dart';
import 'package:medico/utils/textfield.dart';

import '../../../theme/palette.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final con = TextEditingController();
  final con1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 40,
          width: 40,
          child: Image.network(Photos.title),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Hello!",
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
              "Sign In To Your Account",
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
              icon: Icons.email,
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
          Container(
            padding: const EdgeInsets.only(
              left: 22,
            ),
            child: Row(
              children: [
                const Text(
                  "New User?",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      color: Colors.black45),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context, SignUp.route());
                    },
                    icon: const Text(
                      "SignUp",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Colors.black54),
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, HomeScreen.route());
              },
              icon: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "Sign In",
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
