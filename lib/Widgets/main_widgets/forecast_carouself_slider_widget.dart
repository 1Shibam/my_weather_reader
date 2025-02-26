import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_reader/Widgets/reusable_widgets/forecats_tile.dart';
import 'package:weather_reader/Widgets/reusable_widgets/get_weather_icon.dart';
import 'package:weather_reader/models/forecast_model/forecast_list.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

class ForecastsCarouselsliderWidget extends StatelessWidget {
  const ForecastsCarouselsliderWidget({
    super.key,
    required this.forecastData,
    required this.date
  });

  final Map<String, List<ForecastList>> forecastData;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date Header
        Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Text(
            formatDateTime(date),
            style: AppTextStyles.heading1.copyWith(fontSize: 18.sp),
          ),
        ),

        // Horizontal Carousel
        CarouselSlider(
          items: forecastData[date]!.map((forecast) {
            return Container(
              width: 400.w,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: AppColors.waterBlue,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Time
                  ForecastTile(
                      title: forecast.forecastDateTime.split(' ')[1],
                      leading: getWeatherIcon(
                          forecast.description,
                          width: 24,
                          height: 24,
                          isDayTime(forecast.forecastDateTime.split(' ')[1]))),

                  // Temperature
                  ForecastTile(
                      leading: Icon(Icons.thermostat,
                          color: Colors.white, size: 22.sp),
                      title: "${forecast.temperature}°C"),

                  // Weather Description
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ForecastTile(
                        leading: SvgPicture.asset(
                          'assets/new/weather-svgrepo-com.svg',
                          height: 24.sp,
                          width: 24.sp,
                        ),
                        title: forecast.description,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 130.h,
            enlargeCenterPage: true,
            viewportFraction: 0.7,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

// Function to format date as 'DD/MM/YYYY, DayName'
String formatDateTime(String dateTime) {
  final date = DateTime.parse(dateTime);
  return '${date.day}/${date.month}/${date.year}, ${DateFormat.EEEE().format(date)}';
}

bool isDayTime(String forecastTime) {
  final time = int.parse(forecastTime.split(':')[0]);
  return time >= 6 && time < 18;
}