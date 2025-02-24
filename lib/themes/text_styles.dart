import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fonts.dart';

class AppTextStyles {
  static TextStyle get regular => TextStyle(
        fontFamily: Fonts.fontRegular,
        fontSize: 16.sp,
        color: Colors.white,
      );

  static TextStyle get bold => TextStyle(
        fontFamily: Fonts.fontBold,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  static TextStyle get light => TextStyle(
        fontFamily: Fonts.fontRegular,
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
        color: Colors.white70,
      );

  static TextStyle get heading1 => TextStyle(
        fontFamily: Fonts.fontBold,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  // Heading 2 (Subheadings)
  static TextStyle get heading2 => TextStyle(
        fontFamily: Fonts.fontMedium,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white70,
      );

  static TextStyle get subtitle => TextStyle(
        fontFamily: Fonts.fontRegular,
        fontSize: 14.sp,
        fontWeight: FontWeight.w200,
        color: Colors.white54,
      );

  static TextStyle get myStyle => TextStyle(
      fontFamily: Fonts.fontMedium, fontSize: 20.sp, color: Colors.white);
}
