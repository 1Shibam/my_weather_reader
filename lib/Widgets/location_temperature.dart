import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class LocationTemperature extends StatefulWidget {
  final double tempInCelcious;
  const LocationTemperature({super.key, required this.tempInCelcious});

  @override
  State<LocationTemperature> createState() => _LocationTemperatureState();
}

class _LocationTemperatureState extends State<LocationTemperature> {
  bool isInCelcious = true;

  // Method to convert Celsius to Fahrenheit
  double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.waterBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      title: Row(
        children: [
          Text(
            'Temp',
            style: AppTextStyles.heading2,
          ),
          SizedBox(width: 8.w),
          const Icon(
            Icons.thermostat,
            color: Colors.white,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            
            onTap: () => setState(() {
              isInCelcious = !isInCelcious;
            }),
            child: Icon(
              Icons.swap_horiz_outlined,
              color: Colors.white,
              size: 36.sp,
            ),
          ),
          Text(
            isInCelcious
                ? '${widget.tempInCelcious.toStringAsFixed(2)} °C' // Show Celsius
                : '${celsiusToFahrenheit(widget.tempInCelcious).toStringAsFixed(2)} °F', // Show Fahrenheit
            style: AppTextStyles.heading1.copyWith(fontSize: 28.sp),
          ),
        ],
      ),
    );
  }
}
