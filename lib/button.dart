import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  Function()? onTap;

  MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.black),
          color: const Color( 0xff623663)
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
