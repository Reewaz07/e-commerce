import 'package:ecommerce_app/home/carousel_ads.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(245, 255, 255, 255),
      appBar: AppBar(title: Text("Hamro Pasal"), centerTitle: true),

      body: SingleChildScrollView(
        child: Column(children: [Text("Hot Deals"), SizedBox(height: 10),HomeCarousel(
          banners: 
          )
          ]),
      ),
    );
  // 
}
}