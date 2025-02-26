import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/Widgets/data_widgets/weather_details.dart';
import 'package:weather_reader/Widgets/main_widgets/search_location_widget.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          const SearchLocationWidget(),
          SizedBox(height: 10.h),
          const WeatherDetails(),
        ],
      ),
    );
  }
}