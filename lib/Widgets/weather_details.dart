import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/city_name.dart';


class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [LocationName()],
      ),
    );
  }
}



