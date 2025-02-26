import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/themes/text_styles.dart';

class ForecastTile extends StatelessWidget {
  final String title;
  final Widget leading;
  const ForecastTile({super.key, required this.leading, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        leading: leading,
        title: Text(
          title,
          style: AppTextStyles.bold,
        ),
      ),
    );
  }
}