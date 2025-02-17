import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class OtherWeatherDetailsExpansionTile extends StatelessWidget {
  const OtherWeatherDetailsExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: ExpansionTile(
        title: Text(
          'Other Detials',
          style: AppTextStyles.heading2,
        ),
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        backgroundColor: AppColors.waterBlue,
        collapsedBackgroundColor: AppColors.waterBlue,
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        initiallyExpanded: true,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check),
                      Text(
                        'bruh - bruh',
                        style: AppTextStyles.heading1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
