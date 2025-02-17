import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/city_name.dart';
import 'package:my_weather_reader/Widgets/get_weather_animation.dart';
import 'package:my_weather_reader/Widgets/location_temperature.dart';
import 'package:my_weather_reader/Widgets/other_weather_details_expansion_tile.dart';
import 'package:my_weather_reader/Widgets/weather_condition.dart';
import 'package:my_weather_reader/providers/weather_animation_provider.dart';



class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LocationName(
            locationName: 'Jammu And Kashmir',
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
              const Expanded(child: LocationTemperature(tempInCelcious: 43.78)),
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
      ),
    );
  }
}
