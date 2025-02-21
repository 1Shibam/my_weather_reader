import 'package:flutter/material.dart';
import 'package:weather_reader/themes/text_styles.dart';



//? warning dialog used in warning and suggestion switch widget
void showWarningDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("NOTE",
          style: AppTextStyles.heading1.copyWith(color: Colors.red)),
      content: RichText(
        text: TextSpan(
            text:
                "The suggested location may display different results because coordinate-based searches provide more precise locations.\n",
            style: AppTextStyles.heading2.copyWith(color: Colors.red),
            children: [
              TextSpan(
                  text:
                      "\nYou can turn off the suggestions using the switch on the right",
                  style: AppTextStyles.heading2.copyWith(color: Colors.blue))
            ]),
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
