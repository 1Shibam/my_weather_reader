import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_reader/Widgets/data_widgets/details_widget.dart';
import 'package:weather_reader/Widgets/reusable_widgets/error_state_widget.dart';
import 'package:weather_reader/providers/data_providers/weather_forecast_provider.dart';
import 'package:weather_reader/providers/data_providers/weather_service_provider.dart';
import 'package:weather_reader/themes/text_styles.dart';

class WeatherDetails extends ConsumerWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final weatherState = ref.watch(weatherServiceNotifierProvider);
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      switchInCurve: Curves.easeInOutCirc,
      switchOutCurve: Curves.easeInOutCirc,
      child: weatherState.when(
          data: (data) {
            ref
                .read(weatherForecastProvider.notifier)
                .getWeatherForecastWithCoordinates(
                    data.latitude, data.longitude);
            return Material(
              color: Colors.transparent,
              child: DetailsWidget(
                locationName: data.cityName,
                country: data.country,
                isDayTime:
                    isDayTime(data.sunrise, data.sunset, data.currentTime),
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
              ),
            );
          },
          error: (error, stackTrace) => const Material(
                color: Colors.transparent,
                child: Center(
                  child: ErrorStateWidget(),
                ),
              ),
          loading: () => Material(
                color: Colors.transparent,
                child: Center(
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
                ),
              )),
    );
  }
}

//! some required methods don't touch--

bool isDayTime(int sunrise, int sunset, int current) {
  return current >= sunrise && current < sunset;
}
