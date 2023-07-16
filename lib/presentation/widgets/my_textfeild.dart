import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  final controller;
  final String hintext;
  final bool obscureText;

  const MyTextFeild(
      {Key? key,
      this.controller,
      required this.hintext,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(offset: Offset(2, 2), blurRadius: 5),
            BoxShadow(offset: Offset(-2, -2), blurRadius: 5),
          ],
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              fillColor: Colors.brown.shade200,
              filled: true,
              hintText: hintext),
        ),
      ),
    );
  }
}
