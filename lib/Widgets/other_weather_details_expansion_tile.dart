import 'package:flutter/material.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class OtherWeatherDetailsExpansionTile extends StatelessWidget {
  const OtherWeatherDetailsExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Other Details',
        style: AppTextStyles.heading2,
      ),
    );
  }
}
