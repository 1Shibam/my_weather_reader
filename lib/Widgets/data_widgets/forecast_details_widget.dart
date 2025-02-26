import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_reader/models/forecast_model/forecast_list.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

class ForecastDetailsWidget extends StatelessWidget {
  final Map<String, List<ForecastList>> forecastData;
  final String location;
  final String country;

  const ForecastDetailsWidget({
    super.key,
    required this.forecastData,
    required this.country,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Location Header
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20.h),
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
          ),
          child: Row(
            children: [
              Icon(Icons.location_on, size: 32.r, color: Colors.red),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  '$location, $country',
                  style: AppTextStyles.heading1.copyWith(fontSize: 22.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        // Forecast List
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
            ),
            children: forecastData.keys.map((date) {
              return Container(
                margin: EdgeInsets.only(bottom: 16.h),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.skyBlue.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
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
                          height: 4.h,
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
                                leading: SvgPicture.asset(
                                  'assets/new/time-svgrepo-com.svg',
                                  height: 18.sp,
                                  width: 18.sp,
                                ),
                              ),

                              // Temperature
                              ForecastTile(
                                  leading: Icon(Icons.thermostat,
                                      color: Colors.white, size: 22.sp),
                                  title: "${forecast.temperature}°C"),

                              // Weather Description
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
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 130.h,
                        enlargeCenterPage: true,
                        viewportFraction: 0.7,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class ForecastTile extends StatelessWidget {
  final String title;
  final Widget leading;
  const ForecastTile({super.key, required this.leading, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      leading: leading,
      title: Text(
        title,
        style: AppTextStyles.bold,
      ),
    ));
  }
}

// Function to format date as 'DD/MM/YYYY, DayName'
String formatDateTime(String dateTime) {
  final date = DateTime.parse(dateTime);
  return '${date.day}/${date.month}/${date.year}, ${DateFormat.EEEE().format(date)}';
}
