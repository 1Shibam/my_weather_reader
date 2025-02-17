import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/city_name.dart';
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
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: geoLocator.when(
            data: (data) {
              final location = ref.read(weatherServiceNotifierProvider.notifier).searchCoordinates(data.latitude, data.longitude);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LocationName(
                    locationName: '',
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: WeatherCondition(
                          isDayTime: false,
                          weatherCondition: 'clear sky hai yaar tu samjah',
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      const Expanded(
                          child: LocationTemperature(tempInCelcious: 43.78)),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final showAnimation =
                          ref.watch(weatherAnimationStateProvider);
                      return showAnimation
                          ? Column(
                              children: [
                                getWeatherAnimation('snow', false),
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
              );
            },
            error: (error, stackTrace) {
              return const Center(
                child: Text('nigga'),
              );
            },
            loading: ()=> Center(child: Image.asset('assets/animations/weather-animation.gif'),)));
  }
}
