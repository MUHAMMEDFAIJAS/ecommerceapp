import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Text(
            'HOME SCREEN',
            style: TextStyle(fontSize: 30),
          ),
         
               CarouselSlider(items: , options: CarouselOptions())
        ],
      ),
    );
  }
}
