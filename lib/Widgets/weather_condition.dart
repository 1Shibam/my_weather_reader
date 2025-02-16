import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/get_weather_icon.dart';
import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class WeatherCondition extends StatelessWidget {
  const WeatherCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.waterBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      title: Row(
        children: [
          Text(
            'Weahter Condition',
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
        children: [getWeatherIcon('haze', true)],
      ),
    );
    
  }
}
