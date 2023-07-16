import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.brown.shade100,
              shape: BoxShape.circle,
              border: Border.all(width: 2,color: Colors.grey),
            ),
            child: Center(
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon:  Icon(Icons.arrow_back,color: Colors.grey.shade700,),),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Text('Product Details...',style: GoogleFonts.aBeeZee(fontSize: 35,color: Colors.grey.shade700),),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28),
                      child: Container(
                        padding: const EdgeInsets.all(38),
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 1,color: Colors.black),
                            color: Colors.brown.shade100),
                        child: Image.network(product.image!,),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Positioned(
                       top: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 450.0,left: 28,right: 28),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 79,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 1,color: Colors.black.withOpacity(.1),),
                            color: Colors.brown.withOpacity(.34)
                          ),
                          child: Text(
                            product.description!,
                            style: GoogleFonts.abel(color: Colors.grey.shade900,fontWeight: FontWeight.bold,fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  product.category!,
                  style: GoogleFonts.abel(color: Colors.grey.shade900,fontWeight: FontWeight.bold,fontSize: 36),
                ),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
