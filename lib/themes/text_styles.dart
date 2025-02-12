import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fonts.dart';

class AppTextStyles {
  // Regular Text Style
  static TextStyle get regular => TextStyle(
        fontFamily: Fonts.fontRegular,
        fontSize: 16.sp, // Use ScreenUtil for responsiveness
        color: Colors.white, // Light text for visibility on blue background
      );

  // Bold Text Style (for stronger emphasis)
  static TextStyle get bold => TextStyle(
        fontFamily: Fonts.fontBold,
        fontSize: 18.sp, // Use ScreenUtil for responsiveness
        fontWeight: FontWeight.bold,
        color: Colors.white, // Light text for emphasis on blue background
      );

  // Light Text Style (lighter than regular)
  static TextStyle get light => TextStyle(
        fontFamily: Fonts.fontRegular,
        fontSize: 16.sp, // Use ScreenUtil for responsiveness
        fontWeight: FontWeight.w300, // Lighter weight
        color: Colors.white70, // Slightly transparent white for subtle effect
      );

  // Heading 1 (Larger text style for titles or headings)
  static TextStyle get heading1 => TextStyle(
        fontFamily: Fonts.fontBold,
        fontSize: 24.sp, // Use ScreenUtil for responsiveness
        fontWeight: FontWeight.bold,
        color: Colors.white, // Light white text for headings
      );

  // Heading 2 (Subheadings)
  static TextStyle get heading2 => TextStyle(
        fontFamily: Fonts.fontMedium,
        fontSize: 20.sp, // Use ScreenUtil for responsiveness
        fontWeight: FontWeight.w400, // Medium weight for subtler heading
        color: Colors.white70, // Light but not too bright for subheadings
      );

  // Subtitle Text Style (lighter than regular)
  static TextStyle get subtitle => TextStyle(
        fontFamily: Fonts.fontRegular,
        fontSize: 14.sp, // Use ScreenUtil for responsiveness
        fontWeight: FontWeight.w200, // Very light weight
        color: Colors.white54, // Even more subtle light color for subtitles
      );
}
