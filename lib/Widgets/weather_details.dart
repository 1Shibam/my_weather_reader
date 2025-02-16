import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/city_name.dart';
import 'package:my_weather_reader/Widgets/weather_condition.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LocationName(
            locationName: 'Jammu And Kashmir',
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              const Expanded(
                child: WeatherCondition(
                  isDayTime: true,
                  weatherCondition: 'snow',
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              const Expanded(
                child: WeatherCondition(
                  isDayTime: true,
                  weatherCondition: 'snow',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
