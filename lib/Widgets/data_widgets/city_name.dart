import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/Widgets/main_widgets/other_weather_details_expansion_tile.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

class LocationName extends StatelessWidget {
  final String locationName;
  final int currentTime;
  const LocationName(
      {super.key, required this.locationName, required this.currentTime});

  @override
  Widget build(BuildContext context) {
    String time = formatTime(currentTime);
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
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locationName,
            style: AppTextStyles.heading1.copyWith(fontSize: 28.sp),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            time,
            style: AppTextStyles.heading1,
          ),
        ],
      ),
    );
  }
}
