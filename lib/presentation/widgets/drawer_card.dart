import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerCard extends StatelessWidget {
  final String leading;
  final String imgPart;

  const DrawerCard({
    Key? key,
    required this.leading,
    required this.imgPart,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white,width: 1),
          boxShadow: const [
            BoxShadow(offset: Offset(3, 3), blurRadius: 5),
            BoxShadow(offset: Offset(-3, -3), blurRadius: 5)
          ],
        ),
        child: Row(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(imgPart,height: 30,width: 30,color: Colors.white,),
            ),
            Text(
              leading,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            Expanded(child: Container()),
            CupertinoButton(
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
