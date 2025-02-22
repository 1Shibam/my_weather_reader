import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/new/humidity-svgrepo-com.svg',
                            width: 32.sp,
                            height: 32.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Humidity',
                            style: AppTextStyles.heading1,
                          ),
                        ],
                      ),
                      Text(
                        '$humidity %',
                        style: AppTextStyles.heading1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
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
            tempMin REAL,
            tempMax REAL,
            humidity INTEGER,
            windSpeed REAL,
            windDeg INTEGER,
           ! description TEXT,
            cloudCoverage INTEGER,
            pressure INTEGER,
            sunrise INTEGER,
            sunset INTEGER,
            currentTime INTEGER,
            timezone INTEGE
 */