import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/app_bar_widget.dart';
import 'package:my_weather_reader/Widgets/drawer_widget.dart';
import 'package:my_weather_reader/Widgets/forecast_details_widget.dart';
import 'package:my_weather_reader/Widgets/search_location_widget.dart';
import 'package:my_weather_reader/Widgets/weather_details.dart';
import 'package:my_weather_reader/providers/data_providers/weather_service_provider.dart';
import 'package:my_weather_reader/themes/app_colors.dart';

class WeatherHomeScreen extends ConsumerStatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends ConsumerState<WeatherHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBarWidget(
          onRefresh: () {
            ref
                .read(weatherServiceNotifierProvider.notifier)
                .initializeWeatherStates();
          },
        ),
        drawer: const DrawerWidget(),
        backgroundColor: AppColors.darkBlue,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const SearchLocationWidget(),
              SizedBox(height: 20.h),
              const WeatherDetails(),
              const ForecastDetailsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
