import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/Widgets/reusable_widgets/other_details_tile.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

class OtherWeatherDetailsExpansionTile extends StatelessWidget {
  final int humidity;
  final double minTemperature;
  final double maxTemperature;
  final double windSpeed;
  final int windDeg;
  final int cloudCoverage;
  final int sunrise;
  final int sunset;
  final int pressure;
  final int timezone;
  final int currentTime;

  const OtherWeatherDetailsExpansionTile(
      {super.key,
      required this.humidity,
      required this.minTemperature,
      required this.maxTemperature,
      required this.windSpeed,
      required this.windDeg,
      required this.cloudCoverage,
      required this.sunrise,
      required this.sunset,
      required this.pressure,
      required this.currentTime,
      required this.timezone});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: ExpansionTile(
        title: Text(
          'Other Detials',
          style: AppTextStyles.heading2,
        ),
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        backgroundColor: AppColors.waterBlue,
        collapsedBackgroundColor: AppColors.waterBlue,
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        initiallyExpanded: true,
        children: [
          OtherDetailsTile(
            value: "$humidity %",
            title: 'Humidity',
            iconPath: 'assets/new/humidity-svgrepo-com.svg',
          ),
          OtherDetailsTile(
            value: "$sunrise %",
            title: 'Sunrise',
            iconPath: 'assets/new/sunrise.svg',
          ),
          OtherDetailsTile(
            value: "$sunset %",
            title: 'Sunset',
            iconPath: 'assets/new/sunset.svg',
          ),
          OtherDetailsTile(
            value: "$pressure hPa",
            title: 'Pressure',
            iconPath: 'assets/new/pressure-svgrepo-com.svg',
          ),
          OtherDetailsTile(
            value: "$minTemperature °C",
            title: 'Min Temp',
            iconPath: 'assets/new/min temp.svg',
            iconColor: const Color.fromARGB(255, 174, 55, 55),
          ),
          OtherDetailsTile(
            value: "$maxTemperature °C",
            title: 'Max Temp',
            iconPath: 'assets/new/max temp.svg',
          ),
          OtherDetailsTile(
            value: "$cloudCoverage %",
            title: 'Clouds',
            iconPath: 'assets/new/cloud cover.svg',
          ),
          OtherDetailsTile(
            value: "$windSpeed m/s",
            title: 'Wind Speed',
            iconPath: 'assets/new/wind-svgrepo-com.svg',
          ),
          OtherDetailsTile(
            value: switch (windDeg) {
              0 || 360 => '$windDeg° (N)', // North
              90 => '$windDeg° (E)', // East
              180 => '$windDeg° (S)', // South
              270 => '$windDeg° (W)', // West

              > 0 && < 90 => '$windDeg° (NE)', // Northeast
              > 90 && < 180 => '$windDeg° (SE)', // Southeast
              > 180 && < 270 => '$windDeg° (SW)', // Southwest
              > 270 && < 360 => '$windDeg° (NW)', // Northwest

              _ => '$windDeg° (Unknown)', // Fallback case
            },
            title: 'Wind Dir.',
            iconColor: const Color.fromARGB(255, 0, 69, 125),
            iconPath: 'assets/new/wind direction.svg',
          ),
        ],
      ),
    );
  }
}



/*
CREATE TABLE weatherTable(
            weatherID INTEGER PRIMARY KEY AUTOINCREMENT,
           ! cityName TEXT NOT NULL,
            REAL lat,
            REAL lon,
           ! temperature REAL,
           ! tempMin REAL,
           ! tempMax REAL,
           ! humidity INTEGER,
           ! windSpeed REAL,
           ! windDeg INTEGER,
           ! description TEXT,
            !cloudCoverage INTEGER,
            pressure INTEGER,
            sunrise INTEGER,
            sunset INTEGER,
            currentTime INTEGER,
            timezone INTEGE
 */