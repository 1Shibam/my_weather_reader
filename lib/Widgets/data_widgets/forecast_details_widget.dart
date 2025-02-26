import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_reader/Widgets/main_widgets/forecast_carouself_slider_widget.dart';

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
                child: ForecastsCarouselsliderWidget(
                  forecastData: forecastData,
                  date: date,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
