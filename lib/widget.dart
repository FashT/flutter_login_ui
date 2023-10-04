import 'package:flutter/material.dart';
Gradient gradientTry = const LinearGradient(
  colors: [
    Color(
      0xff623663,
    ),
    Color(
      0xffb33d7e,
    ),
  ],
  begin: Alignment.topRight,
  end: Alignment.bottomCenter,
);

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}