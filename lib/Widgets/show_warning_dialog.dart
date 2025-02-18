
  import 'package:flutter/material.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

void showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("NOTE",
            style: AppTextStyles.heading1.copyWith(color: Colors.red)),
        content: Text(
          "The weather data is based on precise coordinates, which may result in a different display name than the suggested search location.",
          style: AppTextStyles.heading2.copyWith(color: Colors.red),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK",
                style: AppTextStyles.heading2.copyWith(color: Colors.blue)),
          ),
        ],
      ),
    );
  }