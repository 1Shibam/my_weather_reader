import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/drawer_widget.dart';
import 'package:my_weather_reader/Widgets/search_location_widget.dart';
import 'package:my_weather_reader/Widgets/weather_details.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                //? refresh the states right here
              },
              icon: Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 32.sp,
                ),
              ))
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Icon(
                    Icons.menu_sharp,
                    color: Colors.white,
                    size: 32.sp,
                  ),
                ));
          },
        ),
      ),
      drawer: const DrawerWidget(),
      backgroundColor: AppColors.darkBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          const SearchLocationWidget(),
          SizedBox(height: 20.h),
          const WeatherDetails()
        ],
      ),
    );
  }
}
