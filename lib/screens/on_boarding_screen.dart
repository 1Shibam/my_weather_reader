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
        body: PageView(
      controller: _controller,
    ));
  }

  Widget _buildPage(
      {required String image,
      required String title,
      required String description}) {
    return Container(
      color: AppColors.darkBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 250.w, height: 250.h),
          SizedBox(height: 20.h),
          Text(title,
              style: AppTextStyles.heading1, textAlign: TextAlign.center),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(description,
                style: AppTextStyles.regular, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

class BuildOnBoardingPages extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final bool hasButton;
  const BuildOnBoardingPages(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      this.hasButton = false});

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
          hasButton ? Container(
            
          ) : const SizedBox.shrink()
        ],
      ),
    );
  }
}
