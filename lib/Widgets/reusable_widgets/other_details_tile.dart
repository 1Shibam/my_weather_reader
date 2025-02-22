// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_reader/themes/text_styles.dart';

class OtherDetailsTile extends StatelessWidget {
  const OtherDetailsTile(
      {super.key,
      required this.value,
      required this.title,
      required this.iconPath,
      this.iconColor});

  final dynamic value;
  final String title;
  final String iconPath;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 28.sp,
                  height: 28.sp,
                  color: iconColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  title,
                  style: AppTextStyles.heading1.copyWith(fontSize: 24),
                ),
              ],
            ),
            Text(
              '$value',
              style: AppTextStyles.heading1.copyWith(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
