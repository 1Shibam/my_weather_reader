// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_weather_reader/Widgets/fade_transition_widget.dart';
import 'package:my_weather_reader/screens/weather_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const FadeInWidget(child: WeatherScreen())), // Your main page
      );
    });

    return Scaffold(
      backgroundColor: Colors.blue, // Background color
      body: Center(
        child: Image.asset(
            'assets/images/ic_launcher_monochrome.png'), // Your app icon
      ),
    );
  }
}
