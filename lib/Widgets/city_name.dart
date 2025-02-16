import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class LocationName extends StatelessWidget {
  final String locationName;
  const LocationName({super.key, required this.locationName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            'Location',
            style: AppTextStyles.heading2,
          ),
          SizedBox(
            width: 8.w,
          ),
          Icon(
            Icons.location_on,
            size: 28.sp,
            color: Colors.red,
          ),
        ],
      ),
      tileColor: AppColors.waterBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      subtitle: Text(
        locationName,
        style: AppTextStyles.heading1.copyWith(fontSize: 28.sp),
      ),
    );
  }
}
