import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_weather_reader/screens/splash_screen.dart';

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
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              const BuildOnBoardingPages(
                  imageUrl: 'assets/animations/stay updated with weather.png',
                  title: 'Stay Updated with the Weather',
                  description:
                      'Get real-time weather updates for your location.'),
              const BuildOnBoardingPages(
                  imageUrl: 'assets/animations/location pin final.gif',
                  title: 'Search Any Location',
                  description: 'Find weather details by name or coordinates.'),
              BuildOnBoardingPages(
                imageUrl: 'assets/animations/forecast.png',
                title: '5-Day Forecast',
                description: 'Plan ahead with a 5-day weather forecast.',
                hasButton: true,
                onPressed: () {
                  setOnBoardingPreference(true);

                  context.go('/');
                },
              ),
            ],
          ),
          Positioned(
            bottom: 100.h,
            left: 0,
            right: 0,
            child: SmoothPageIndicator(
              onDotClicked: (index) {
                _controller.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCirc);
              },
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.skyBlue,
                dotColor: Colors.white54,
                dotHeight: 8.h,
                dotWidth: 8.w,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class BuildOnBoardingPages extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final bool hasButton;
  final void Function()? onPressed;
  const BuildOnBoardingPages(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      this.hasButton = false,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 200.w,
            height: 200.h,
          ),
          SizedBox(height: 20.h),
          Text(
            title,
            style: AppTextStyles.heading1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Text(
              description,
              style: AppTextStyles.regular,
              textAlign: TextAlign.center,
            ),
          ),
          hasButton
              ? Container(
                  padding: EdgeInsets.all(12.w),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.waterBlue,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.transparent),
                        foregroundColor:
                            WidgetStatePropertyAll(Colors.transparent),
                        shadowColor: WidgetStatePropertyAll(Colors.transparent),
                      ),
                      onPressed: onPressed,
                      child: Text(
                        'Get Started',
                        style: AppTextStyles.heading1,
                      )),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
