import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/Widgets/get_weather_icon.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';


class WeatherCondition extends StatelessWidget {
  final String weatherCondition;
  final bool isDayTime;
  const WeatherCondition({super.key, required this.weatherCondition, required this.isDayTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.waterBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      title: Row(
        children: [
          Text(
            'Weather',
            style: AppTextStyles.heading2,
          ),
          SizedBox(
            width: 8.w,
          ),
          const Icon(
            Icons.cloud,
            color: Colors.white,
          )
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getWeatherIcon(weatherCondition, isDayTime),
          Text(
            weatherCondition,
            style: AppTextStyles.heading1.copyWith(fontSize: 28.sp),
          )
        ],
      ),
    );
  }
}
