import 'package:flutter/material.dart';
import 'package:my_weather_reader/Widgets/fade_transition_widget.dart';

Widget getWeatherAnimation(String description, bool isDaytime) {
  String gifAssetPath;

  switch (description.toLowerCase()) {
    case 'clear sky':
      gifAssetPath = isDaytime
          ? 'assets/animations/Clear_Sky(day).gif'
          : 'assets/animations/Clear_Sky(night).gif';
      break;
    case 'few clouds':
      gifAssetPath = isDaytime
          ? 'assets/animations/few-Clouds(day).gif'
          : 'assets/animations/few-Clouds(night).gif';
      break;
    case 'scattered clouds':
      gifAssetPath = isDaytime
          ? 'assets/animations/Scattered-Clouds(day).gif'
          : 'assets/animations/Scattered-Clouds(night).gif';
      break;
    case 'broken clouds':
    case 'overcast clouds':
      gifAssetPath = isDaytime
          ? 'assets/animations/broken-clouds.gif'
          : 'assets/animations/broken-clouds.gif';
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
      gifAssetPath = isDaytime
          ? 'assets/animations/Rain-all.gif'
          : 'assets/animations/Rain-all.gif';
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
      gifAssetPath = isDaytime
          ? 'assets/animations/Rain-all.gif'
          : 'assets/animations/Rain-all.gif';
      break;
    case 'thunderstorm':
    case 'light thunderstorm':
    case 'heavy thunderstorm':
    case 'ragged thunderstorm':
      gifAssetPath = isDaytime
          ? 'assets/animations/ThunderStorm-only.gif'
          : 'assets/animations/ThunderStorm-only.gif';
      break;

    case 'thunderstorm with light rain':
    case 'thunderstorm with rain':
    case 'thunderstorm with heavy rain':
    case 'thunderstorm with light drizzle':
    case 'thunderstorm with drizzle':
    case 'thunderstorm with heavy drizzle':
      gifAssetPath = isDaytime
          ? 'assets/animations/ThunderStorm(with-rain).gif'
          : 'assets/animations/ThunderStorm(with-rain).gif';
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
      gifAssetPath = isDaytime
          ? 'assets/animations/snofall(day).gif'
          : 'assets/animations/snofall(night).gif';
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
      gifAssetPath = isDaytime
          ? 'assets/animations/mist(day).gif'
          : 'assets/animations/mist(night).gif';
      break;
    default:
      gifAssetPath =
          'assets/animations/snofall(night).gif'; // Default animation
  }

  return FadeInWidget(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      child: Image.asset(
        filterQuality: FilterQuality.none,
        gifAssetPath,
        fit: BoxFit.fitWidth, // Use your desired BoxFit option
        width: 400, // Adjust width as per your requirement
        height: 300, // Adjust height as per your requirement
      ),
    ),
  );
}
