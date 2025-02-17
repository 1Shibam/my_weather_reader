import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:my_weather_reader/Widgets/city_name.dart';
import 'package:my_weather_reader/Widgets/error_state_widget.dart';
import 'package:my_weather_reader/Widgets/get_weather_animation.dart';
import 'package:my_weather_reader/Widgets/location_temperature.dart';
import 'package:my_weather_reader/Widgets/other_weather_details_expansion_tile.dart';
import 'package:my_weather_reader/Widgets/weather_condition.dart';
import 'package:my_weather_reader/providers/geo_locator_provider.dart';

import 'package:my_weather_reader/providers/weather_animation_provider.dart';
import 'package:my_weather_reader/providers/weather_service_provider.dart';

class WeatherDetails extends ConsumerWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final geoLocator = ref.watch(geoNotifierStateProvider);
    final weatherState = ref.watch(weatherServiceNotifierProvider);
    ref.listen(geoNotifierStateProvider, (previous, next) {
      next.whenData((location) {
        ref
            .read(weatherServiceNotifierProvider.notifier)
            .searchCoordinates(location.latitude, location.speed);
      });
    });

    return geoLocator.when(
        data: (location) {

          return weatherState.when(
              data: (data) {
               
                return DetailsWidget(
                    locationName: data.cityName,
                    isDayTime: false,
                    weatherCondition: data.description,
                    tempInCelcious: data.temperature);
              },
              error: (error, stackTrace) {
                return const Center(
                  child: ErrorStateWidget(),
                );
              },
              loading: () => Center(
                    child:
                        Image.asset('assets/animations/weather-animation.gif'),
                  ));
        },
        error: (error, stackTrace) {
          return const Center(
            child: ErrorStateWidget(),
          );
        },
        loading: () => Center(
              child: Image.asset('assets/animations/weather-animation.gif'),
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
