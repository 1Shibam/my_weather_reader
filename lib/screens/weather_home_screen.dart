import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/drawer_widget.dart';
import 'package:my_weather_reader/Widgets/search_location_widget.dart';
import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class WeatherHomeScreen extends ConsumerStatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends ConsumerState<WeatherHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Weather-Reader',
          style: AppTextStyles.heading1,
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu_sharp,
                  color: Colors.white,
                  size: 28,
                ));
          },
        ),
      ),
      drawer: const DrawerWidget(),
      backgroundColor: AppColors.darkBlue,
      body: Stack(
        children: [
          // Background gradient container

          // Content area with scrollable widgets
          Column(
            children: [
              SizedBox(height: 20.h), // Use ScreenUtil for height
              const SearchLocationWidget(), // Your search widget
            ],
          ),
        ],
      ),
    );
  }
}
