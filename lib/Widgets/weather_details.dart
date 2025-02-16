import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [LocationName()],
      ),
    );
  }
}

class LocationName extends ConsumerWidget {
  const LocationName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        'Delhi D',
        style: AppTextStyles.heading1.copyWith(fontSize: 32.sp),
      ),
    );
  }
}
