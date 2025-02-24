import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/models/forecast_model/forecast_list.dart';
import 'package:weather_reader/themes/text_styles.dart';

class ForecastDetailsWidget extends StatelessWidget {
  final Map<String, List<ForecastList>> forecastData; // ✅ Accept sorted data

  const ForecastDetailsWidget({super.key, required this.forecastData});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: forecastData.keys.map((date) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🟢 Show Date as a Section Title
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Text(
                    date, // ✅ Display the dynamic date
                    style: AppTextStyles.heading1,
                  ),
                ),

                // 🟢 Show Forecasts for the Date
                Column(
                  children: forecastData[date]!.map((forecast) {
                    return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Time: ${forecast.forecastDateTime.split(' ')[1]}",
                              style: AppTextStyles.subtitle,
                            ),
                            Text(
                              "Temperature: ${forecast.temperature}°C",
                              style: AppTextStyles.bold,
                            ),
                            Text(
                              "Weather: ${forecast.description}",
                              style: AppTextStyles.light,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: double.infinity,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}
