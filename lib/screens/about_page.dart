import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.go('/'),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'About',
          style: AppTextStyles.heading1,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About the Project Section
              Text('📌 About the Project', style: AppTextStyles.bold),
              SizedBox(height: 10.h),
              Text(
                'Weather-Reader is a Flutter-based weather application designed '
                'to provide real-time weather updates for any location worldwide. '
                'The app features a sleek UI, accurate forecasts, and search '
                'suggestions for a smooth user experience.',
                style: AppTextStyles.regular,
              ),
              const Divider(color: AppColors.skyBlue, thickness: 1),

              SizedBox(height: 20.h),

              // APIs Used Section
              Text('🌍 APIs Used', style: AppTextStyles.bold),
              SizedBox(height: 10.h),
              Text(
                '✔ OpenWeatherMap API: Fetches real-time weather data, including '
                'temperature, humidity, wind speed, and forecasts.',
                style: AppTextStyles.regular,
              ),
              SizedBox(height: 5.h),
              Text(
                '✔ LocationIQ API: Provides intelligent search suggestions to '
                'help users quickly find cities and locations.',
                style: AppTextStyles.regular,
              ),
              const Divider(color: AppColors.skyBlue, thickness: 1),

              SizedBox(height: 20.h),

              // Features Section
              Text('⚡ Features', style: AppTextStyles.bold),
              SizedBox(height: 10.h),
              featureItem('Real-time weather updates'),
              featureItem('Search for cities and locations'),
              featureItem('Smooth UI with dark & light mode support'),
              featureItem('Responsive design for all screen sizes'),
              featureItem('Weather forecasts with detailed insights'),
            ],
          ),
        ),
      ),
    );
  }

  Widget featureItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: AppColors.skyBlue, size: 20.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(text, style: AppTextStyles.regular),
          ),
        ],
      ),
    );
  }
}
