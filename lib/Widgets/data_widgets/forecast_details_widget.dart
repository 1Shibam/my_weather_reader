import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/models/forecast_model/forecast_list.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

class ForecastDetailsWidget extends StatelessWidget {
  final Map<String, List<ForecastList>> forecastData;
  final String location;
  final String country;

  const ForecastDetailsWidget(
      {super.key,
      required this.forecastData,
      required this.country,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: AppColors.darkBlue,
          padding: EdgeInsets.only(bottom: 16.h, top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                size: 40.r,
                color: Colors.red,
              ),
              Text(
                '$location, $country',
                style: AppTextStyles.heading1,
              )
            ],
          ),
        ),
        Expanded(
          child: CarouselSlider(
              items: forecastData.keys.map((date) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: forecastData[date]!.map((forecast) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: ListTile(
                          tileColor: AppColors.waterBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          title: Column(
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
                );
              }).toList(),
              options: CarouselOptions(
                height: double.infinity,
                initialPage: 0,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
        ),
      ],
    );
  }
}
