import 'package:flutter/material.dart';
import 'package:my_weather_reader/Widgets/fade_transition_widget.dart';
import 'package:my_weather_reader/utils/app_colors.dart';

Widget myContainer(String heading, String data) {
  return FadeInWidget(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: AppColors.darkBlue.withOpacity(0.9),
              fontSize: 22,
              fontFamily: 'Technoma',
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data,
            style: const TextStyle(
              fontFamily: 'Technoma',
              fontSize: 18,
              color: AppColors.waterBlue,
            ),
          ),
        ],
      ),
    ),
  );
}
