import 'package:flutter/material.dart';

class dividers extends StatelessWidget {
  const dividers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black54,
      height: 5,
      thickness: 0.3,
      indent: 25,
      endIndent: 25,
    );
  }
}
