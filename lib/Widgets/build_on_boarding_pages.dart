import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';


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
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Text(
              description,
              style: AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.h),
          hasButton
              ? Container(
                  margin: EdgeInsets.all(8.w),
                  padding: EdgeInsets.all(4.w),
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
