import 'package:flutter/material.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

void showWarningDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("NOTE",
          style: AppTextStyles.heading1.copyWith(color: Colors.red)),
      content: Text(
        "The suggested location may display different results because coordinate-based searches provide more precise locations.",
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
