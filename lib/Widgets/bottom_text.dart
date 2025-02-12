import 'package:flutter/material.dart';
import 'package:my_weather_reader/themes/fonts.dart';

Align poweredByOpenWeather() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Powered By",
          style: TextStyle(
              fontSize: 20, fontFamily: Fonts.fontRegular, color: Colors.white),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          "OpenWeatherMap",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 20,
            fontFamily: 'Arial', // Replace with Fonts.font1 if available
          ),
        ),
      ],
    ),
  );
}
