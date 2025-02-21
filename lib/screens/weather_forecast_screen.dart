import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WeatherForecastScreen extends StatelessWidget {
  final List<String> images = [
    'assets/images/Broken_Clouds(night).png',
    'assets/images/clouds-svgrepo-com.png',
    'assets/images/Shower-Rain(day).png',
  ];

  WeatherForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carousel Slider")),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: images.map((item) {
            return Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(item, fit: BoxFit.cover, width: 1000),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
