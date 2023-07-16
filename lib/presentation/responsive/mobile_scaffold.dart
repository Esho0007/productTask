import 'package:e_commerse_ozb/presentation/pages/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/product.dart';
import '../pages/product_details_screen.dart';
import '../widgets/drawer_card.dart';

var url = Uri.parse("https://fakestoreapi.com/products");

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  late String stringResponse;
  List<Product> productList = [];

  Future<void> apiCall() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final products =
          jsonBody.map<Product>((data) => Product.fromJson(data)).toList();
      setState(() {
        productList = products;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  void signUserOut() async {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) => const  SignInScreen(),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.grey,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.displaySmall,
            children: const [
              TextSpan(text: 'OZB'),
              TextSpan(
                text: '.com',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white.withOpacity(.34),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // logo
            Column(
              children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/man.png'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Adelani Saheed',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                const DrawerCard(
                  leading: 'phone',
                  imgPart: 'assets/images/phone1.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                const DrawerCard(
                  leading: 'ng3 1lg',
                  imgPart: 'assets/images/address.png',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 130, bottom: 50),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey,
                  border: Border.all(color: Colors.white, width: 1),
                  boxShadow: const [
                    BoxShadow(offset: Offset(3, 3), blurRadius: 5),
                    BoxShadow(offset: Offset(-3, -3), blurRadius: 5)
                  ],
                ),
                child: ListTile(
                  onTap:(){
                    signUserOut() ;
                  },
                  leading: IconButton(
                    onPressed: signUserOut,
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: productList[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        //height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.brown[100],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 5,
                            ),
                            BoxShadow(
                              offset: Offset(0, -3),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 300,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black.withOpacity(.23),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(3, 3),
                                          blurRadius: 10,
                                          color: Colors.grey.shade100)
                                    ],
                                  ),
                                  child: Image.network(
                                    productList[index].image!,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  productList[index].id!.toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3.0, horizontal: 20),
                                child: Text(
                                  productList[index].title!,
                                  style: GoogleFonts.alike(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 23),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productList[index].description!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                      style: GoogleFonts.sansita(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      productList[index].category!,
                                      style: GoogleFonts.abel(fontSize: 13),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${productList[index].rating!.rate}',
                                          style: GoogleFonts.alikeAngular(),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orangeAccent,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${productList[index].rating!.count}',
                                      style: GoogleFonts.alikeAngular(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('All right reserved.'),
              SizedBox(
                width: 6,
              ),
              Icon(Icons.reset_tv_rounded),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Saheed 2023.'),
          ),
        ],
      ),
    );
  }
}
