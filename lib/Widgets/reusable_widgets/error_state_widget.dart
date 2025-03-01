import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

class ErrorStateWidget extends StatelessWidget {
  final String errorMessage;

  const ErrorStateWidget({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/animations/ERROR-OCCURED.png',
                fit: BoxFit.fitWidth,
                width: 400,
                height: 400,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('Possible Fixes:', style: AppTextStyles.heading1),
          const SizedBox(height: 8),
          _buildFixRow("If you're looking for your location, turn it on."),
          _buildFixRow(
              "If not, make sure the location you searched is correctly typed."),
          _buildFixRow("There was no search history available."),
        ],
      ),
    );
  }
}

Widget _buildFixRow(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      contentPadding: EdgeInsets.all(8.sp),
      tileColor: AppColors.waterBlue,
      leading: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 20.sp,
      ),
      title: Text(
        text,
        style: AppTextStyles.bold,
      ),
    ),
  );
}
