import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imgPart;

  const SquareTile({Key? key, required this.imgPart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 1),
          color: Colors.grey.shade200),
      child: Image.asset(
        imgPart,
        height: 40,
      ),
    );
  }
}
