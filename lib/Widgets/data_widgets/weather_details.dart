import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/Widgets/reusable_widgets/error_state_widget.dart';
import 'package:weather_reader/Widgets/reusable_widgets/get_weather_animation.dart';
import 'package:weather_reader/Widgets/data_widgets/location_temperature.dart';
import 'package:weather_reader/Widgets/main_widgets/other_weather_details_expansion_tile.dart';
import 'package:weather_reader/Widgets/data_widgets/weather_condition.dart';
import 'package:weather_reader/providers/data_providers/weather_service_provider.dart';
import 'package:weather_reader/providers/preference_providers/weather_animation_preference_provider.dart';
import 'package:weather_reader/themes/text_styles.dart';

import 'city_name.dart';


class WeatherDetails extends ConsumerWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final weatherState = ref.watch(weatherServiceNotifierProvider);
    return weatherState.when(
        data: (data) {
          return DetailsWidget(
              locationName: data.cityName,
              isDayTime: false,
              weatherCondition: data.description,
              tempInCelcious: data.temperature);
        },
        error: (error, stackTrace) => const Center(
              child: ErrorStateWidget(),
            ),
        loading: () => Center(
              child: Column(
                children: [
                  Image.asset(
                      'assets/animations/locationLoadingAnimation.gif'),
                  Text(
                    'L O A D I N G ',
                    style: AppTextStyles.heading1,
                  )
                ],
              ),
            ));
  }
}

class DetailsWidget extends StatelessWidget {
  final String locationName;
  final bool isDayTime;
  final String weatherCondition;
  final double tempInCelcious;
  const DetailsWidget({
    required this.locationName,
    required this.isDayTime,
    required this.weatherCondition,
    required this.tempInCelcious,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationName(
            locationName: locationName,
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Expanded(
                child: WeatherCondition(
                  isDayTime: false,
                  weatherCondition: weatherCondition,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                  child: LocationTemperature(tempInCelcious: tempInCelcious)),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Consumer(
            builder: (context, ref, child) {
              final showAnimation = ref.watch(weatherAnimationStateProvider);
              return showAnimation
                  ? Column(
                      children: [
                        getWeatherAnimation(weatherCondition, isDayTime),
                        SizedBox(
                          height: 16.h,
                        ),
                      ],
                    )
                  : const SizedBox.shrink();
            },
          ),
          const OtherWeatherDetailsExpansionTile(),
          SizedBox(
            height: 32.h,
          ),
        ],
      ),
    );
  }
}
