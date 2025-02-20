import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              _buildPage(
                image: 'assets/weather_1.png',
                title: 'Stay Updated with the Weather',
                description: 'Get real-time weather updates for your location.',
              ),
              _buildPage(
                image: 'assets/weather_2.png',
                title: 'Search Any Location',
                description: 'Find weather details by name or coordinates.',
              ),
              _buildPage(
                image: 'assets/weather_3.png',
                title: '5-Day Forecast',
                description: 'Plan ahead with a 5-day weather forecast.',
              ),
             
            ],
          ),
          Positioned(
            bottom: 50.h,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.skyBlue,
                    dotColor: Colors.white54,
                    dotHeight: 8.h,
                    dotWidth: 8.w,
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.waterBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
                  ),
                  onPressed: () {
                    // Navigate to the main screen
                  },
                  child: Text('Get Started', style: AppTextStyles.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({required String image, required String title, required String description}) {
    return Container(
      color: AppColors.darkBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 250.w, height: 250.h),
          SizedBox(height: 20.h),
          Text(title, style: AppTextStyles.heading1, textAlign: TextAlign.center),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(description, style: AppTextStyles.regular, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
