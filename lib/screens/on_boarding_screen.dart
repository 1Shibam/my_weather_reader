import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_weather_reader/themes/app_colors.dart';

import 'package:my_weather_reader/themes/text_styles.dart';

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
      child: PageView(
        controller: _controller,
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
