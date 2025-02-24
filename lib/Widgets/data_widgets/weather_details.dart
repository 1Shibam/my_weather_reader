import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/Widgets/reusable_widgets/error_state_widget.dart';
import 'package:weather_reader/Widgets/reusable_widgets/get_weather_animation.dart';
import 'package:weather_reader/Widgets/data_widgets/location_temperature.dart';
import 'package:weather_reader/Widgets/main_widgets/other_weather_details_expansion_tile.dart';
import 'package:weather_reader/Widgets/data_widgets/weather_condition.dart';
import 'package:weather_reader/providers/data_providers/weather_forecast_provider.dart';
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
          ref
              .read(weatherForecastProvider.notifier)
              .getWeatherForecastWithCoordinates(data.latitude, data.longitude);
          return DetailsWidget(
            locationName: data.cityName,
            country: data.country,
            isDayTime: isDayTime(data.sunrise, data.sunset, data.currentTime),
            weatherCondition: data.description,
            tempInCelcious: data.temperature,
            humidity: data.humidity,
            minTemperature: data.minTemperature,
            maxTemperature: data.maxTemperature,
            windSpeed: data.windSpeed,
            windDeg: data.windDeg,
            cloudCoverage: data.cloudCoverage,
            sunrise: data.sunrise,
            sunset: data.sunset,
            pressure: data.pressure,
            timezone: data.timezone,
            currentTime: data.currentTime,
          );
        },
        error: (error, stackTrace) => const Center(
              child: ErrorStateWidget(),
            ),
        loading: () => Center(
              child: Column(
                children: [
                  Image.asset('assets/animations/locationLoadingAnimation.gif'),
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
  final String country;
  final bool isDayTime;
  final String weatherCondition;
  final double tempInCelcious;
  final int humidity;
  final double minTemperature;
  final double maxTemperature;
  final double windSpeed;
  final int windDeg;
  final int cloudCoverage;
  final int sunrise;
  final int sunset;
  final int pressure;
  final int timezone;
  final int currentTime;
  const DetailsWidget({
    required this.locationName,
    required this.country,
    required this.isDayTime,
    required this.weatherCondition,
    required this.tempInCelcious,
    required this.humidity,
    required this.minTemperature,
    required this.maxTemperature,
    required this.windSpeed,
    required this.windDeg,
    required this.cloudCoverage,
    required this.sunrise,
    required this.sunset,
    required this.pressure,
    required this.currentTime,
    required this.timezone,
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
            currentTime: currentTime,
            country: country,
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Expanded(
                child: WeatherCondition(
                  isDayTime: isDayTime,
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
          OtherWeatherDetailsExpansionTile(
              humidity: humidity,
              minTemperature: minTemperature,
              maxTemperature: maxTemperature,
              windSpeed: windSpeed,
              windDeg: windDeg,
              cloudCoverage: cloudCoverage,
              sunrise: sunrise,
              sunset: sunset,
              pressure: pressure,
              currentTime: currentTime,
              timezone: timezone),
          SizedBox(
            height: 32.h,
          ),
        ],
      ),
    );
  }
}

//! some required methods don't touch--

bool isDayTime(int sunrise, int sunset, int current) {
  return current >= sunrise && current < sunset;
}
