import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class ForecastDetailsWidget extends ConsumerStatefulWidget {
  const ForecastDetailsWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForecastDetailsWidgetState();
}

class _ForecastDetailsWidgetState extends ConsumerState<ForecastDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Weather forcast will be here!!',
        style: AppTextStyles.heading1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
