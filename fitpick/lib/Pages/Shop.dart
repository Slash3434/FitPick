import 'package:fitpick/constants/colors.dart';
import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

Widget BuildCard() => Container(
  width: 300,
  height: 300,
  color: Colors.lightBlueAccent,
  child: Column(
    children: [     
      Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXUc9ZZYDwaDWQtIDKpKPah_MKult_4_0VkA&s',
      ),
      SizedBox(height: 6),
      Text(
        "Jordan 4s",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
      ),
      Text(
        "\$170",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: Colors.black
        ),
      )
    ],
  ),
);

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (bounds) => 
            AppColors.primaryGradient.createShader(bounds),
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Shop",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, // Changed from horizontal to vertical
          child: Column(
            children: [
              SizedBox(height: 24),
              BuildCard(),
              SizedBox(height: 18),
              BuildCard(),
              SizedBox(height: 18),
              BuildCard(), // Added another card to make scrolling more visible
              SizedBox(height: 18),
            ],
          ),
        ),
      )
    );
  }
}