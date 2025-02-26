import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/Widgets/data_widgets/forecast_details_widget.dart';
import 'package:weather_reader/models/forecast_model/forecast_list.dart';
import 'package:weather_reader/providers/data_providers/weather_forecast_provider.dart';
import 'package:weather_reader/themes/text_styles.dart';

class WeatherForecastScreen extends StatelessWidget {
  const WeatherForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Consumer(
          builder: (context, ref, child) {
            final forecasts = ref.watch(weatherForecastProvider);
            return AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              switchInCurve: Curves.easeInOutCirc,
              switchOutCurve: Curves.easeInOutCirc,
              child: forecasts.when(
                  data: (data) {
                    Map<String, List<ForecastList>> sortedData = {};
                    List<ForecastList> listData = data.allForecasts;
                    for (var forecast in listData) {
                      String date = forecast.forecastDateTime.split(' ')[0];
                      if (sortedData.containsKey(date)) {
                        sortedData[date]!.add(forecast);
                      } else {
                        sortedData[date] = [forecast];
                      }
                    }

                    return ForecastDetailsWidget(
                      forecastData: sortedData,
                      country: data.country,
                      location: data.cityName,
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(error.toString());
                  },
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
                      )),
            );
          },
        ),
      ),
    );
  }
}

