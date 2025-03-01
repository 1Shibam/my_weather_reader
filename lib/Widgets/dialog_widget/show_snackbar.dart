import 'package:flutter/material.dart';
import 'package:weather_reader/themes/text_styles.dart';

void showSnackBar(String text, BuildContext context,
    {Color bgColor = Colors.grey}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: AppTextStyles.regular,
    ),
    duration: const Duration(seconds: 1),
    backgroundColor: bgColor,
  ));
}
