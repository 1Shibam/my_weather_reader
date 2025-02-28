import 'package:flutter/material.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

void showSnackbar(String text, BuildContext context,
    {Color bgColor = AppColors.skyBlue}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: AppTextStyles.heading2,
    ),
    backgroundColor: bgColor,
  ));
}
