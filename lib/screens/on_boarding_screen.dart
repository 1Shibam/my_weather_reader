import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_weather_reader/Widgets/build_on_boarding_pages.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {
                  //setting prefernce of on boarding page to true it wont show up again
                  setOnBoardingPreference(true);
                  context.go('/');
                },
                child: Text(
                  'S K I P',
                  style: AppTextStyles.heading2,
                )),
          ),
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
                  //set the preference the on boarding page wont show up after this 
                  //same thing will happen when the top skip text button will be pressed 
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


