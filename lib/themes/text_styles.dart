import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'fonts.dart';

class AppTextStyles {
  // Regular (lighter) Text Style
  static TextStyle get regular => TextStyle(
    fontFamily: Fonts.fontRegular,
    fontSize: 16.sp,  // Use ScreenUtil for responsiveness
    color: AppColors.blueShade100,
  );

  // Bold Text Style (for stronger emphasis)
  static TextStyle get bold => TextStyle(
    fontFamily: Fonts.fontBold,
    fontSize: 18.sp,  // Use ScreenUtil for responsiveness
    fontWeight: FontWeight.bold,
    color: AppColors.skyBlue,
  );

  // Light Text Style (lighter than regular)
  static TextStyle get light => TextStyle(
    fontFamily: Fonts.fontRegular,
    fontSize: 16.sp,  // Use ScreenUtil for responsiveness
    fontWeight: FontWeight.w300,  // Lighter weight
    color: AppColors.lightBlueShade,
  );

  // Heading 1 (Larger text style for titles or headings)
  static TextStyle get heading1 => TextStyle(
    fontFamily: Fonts.fontBold,
    fontSize: 24.sp,  // Use ScreenUtil for responsiveness
    fontWeight: FontWeight.bold,
    color: AppColors.darkBlue,
  );

  // Heading 2 (Subheadings)
  static TextStyle get heading2 => TextStyle(
    fontFamily: Fonts.fontMedium,
    fontSize: 20.sp,  // Use ScreenUtil for responsiveness
    fontWeight: FontWeight.w400,  // Medium weight for subtler heading
    color: AppColors.skyBlue,
  );

  // Subtitle Text Style (lighter than regular)
  static TextStyle get subtitle => TextStyle(
    fontFamily: Fonts.fontRegular,
    fontSize: 14.sp,  // Use ScreenUtil for responsiveness
    fontWeight: FontWeight.w200,  // Very light weight
    color: AppColors.lightBlueShade,
  );
}
