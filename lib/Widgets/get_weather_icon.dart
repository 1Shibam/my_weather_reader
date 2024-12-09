import 'package:flutter/material.dart';

Widget getWeatherIcon(String description, bool isDaytime) {
  String imageAssetPath;

  switch (description.toLowerCase()) {
    case 'clear sky':
      imageAssetPath = isDaytime
          ? 'assets/images/Clear-sky(day).png'
          : 'assets/images/Clear-sky(night).png';
      break;
    case 'few clouds':
      imageAssetPath = isDaytime
          ? 'assets/images/Few-Clouds(day).png'
          : 'assets/images/Few-Clouds(night).png';
      break;
    case 'scattered clouds':
      imageAssetPath = isDaytime
          ? 'assets/images/Scattered_clouds(day).png'
          : 'assets/images/Scattered_clouds(night).png';
      break;
    case 'broken clouds':
    case 'overcast clouds':
      imageAssetPath = isDaytime
          ? 'assets/images/Broken_Clouds(day).png'
          : 'assets/images/Broken_Clouds(night).png';
      break;
    case 'shower rain':
    case 'light intensity drizzle':
    case 'drizzle':
    case 'heavy intensity drizzle':
    case 'light intensity drizzle rain':
    case 'drizzle rain':
    case 'heavy intensity drizzle rain':
    case 'shower rain and drizzle':
    case 'heavy shower rain and drizzle':
    case 'shower drizzle':
      imageAssetPath = isDaytime
          ? 'assets/images/Shower-Rain(day).png'
          : 'assets/images/Shower-Rain(night).png';
      break;
    case 'rain':
    case 'light rain':
    case 'moderate rain':
    case 'heavy intensity rain':
    case 'very heavy rain':
    case 'extreme rain':
    case 'freezing rain':
    case 'light intensity shower rain':
    case 'heavy intensity shower rain':
    case 'ragged shower rain':
      imageAssetPath = isDaytime
          ? 'assets/images/Rain(day).png'
          : 'assets/images/Rain(night).png';
      break;
    case 'thunderstorm':
    case 'thunderstorm with light rain':
    case 'thunderstorm with rain':
    case 'thunderstorm with heavy rain':
    case 'light thunderstorm':
    case 'heavy thunderstorm':
    case 'ragged thunderstorm':
    case 'thunderstorm with light drizzle':
    case 'thunderstorm with drizzle':
    case 'thunderstorm with heavy drizzle':
      imageAssetPath = isDaytime
          ? 'assets/images/ThunderStorm.png'
          : 'assets/images/ThunderStorm.png';
      break;
    case 'snow':
    case 'light snow':
    case 'heavy snow':
    case 'sleet':
    case 'light shower sleet':
    case 'shower sleet':
    case 'light rain and snow':
    case 'rain and snow':
    case 'light shower snow':
    case 'shower snow':
    case 'heavy shower snow':
      imageAssetPath =
          isDaytime ? 'assets/images/Snow.png' : 'assets/images/Snow.png';
      break;
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'sand/dust whirls':
    case 'fog':
    case 'sand':
    case 'dust':
    case 'volcanic ash':
    case 'squalls':
    case 'tornado':
      imageAssetPath =
          isDaytime ? 'assets/images/Mist.png' : 'assets/images/Mist.png';
      break;
    default:
      imageAssetPath =
          'assets/images/Clear-sky(day).png'; // Default image if the description is unknown
  }

  return Image.asset(
    imageAssetPath,

    width: 36, // You can adjust the size
    height: 36, // You can adjust the size
  );
}
