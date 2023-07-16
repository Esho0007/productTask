import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;

  const MyButton({Key? key, required this.onTap,required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.brown.shade700,
          border: Border.all(color: Colors.grey,width: 1),
          boxShadow: const [
            BoxShadow(offset: Offset(2, 2), blurRadius: 5),
            BoxShadow(offset: Offset(-2, -2), blurRadius: 5),
          ],
        ),
        child:  Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
