import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/Widgets/main_widgets/other_weather_details_expansion_tile.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

class LocationName extends ConsumerWidget {
  final String locationName;
  final String country;
  final int currentTime;
  final int timezone;
  const LocationName(
      {super.key,
      required this.locationName,
      required this.currentTime,
      required this.timezone,
      required this.country});

  @override
  Widget build(BuildContext context, ref) {
    String time = formatTime(currentTime, timezone);
    return ListTile(
      key: ValueKey(locationName),
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
            "$locationName, $country",
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
