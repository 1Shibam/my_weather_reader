import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class PopularLocationsText extends StatelessWidget {
  const PopularLocationsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Popular Locations',
            style: AppTextStyles.heading1,
          ),
          SizedBox(
            width: 12.w,
          ),
          Icon(
            Icons.location_on,
            color: Colors.red,
            size: 40.spMax,
          )
        ],
      );
  }
}