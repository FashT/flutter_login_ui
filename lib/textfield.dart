import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Widget icon;
  bool obsecureText;
  final TextEditingController? controller;
  final String hintText;
  MyTextField(
      {super.key,
      required this.icon,
      required this.obsecureText,
      this.controller,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: hintText,
          prefix: icon,
          iconColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          fillColor: const Color(0xff623663),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        controller: controller,
        obscureText: obsecureText,
      ),
    );
  }
}
