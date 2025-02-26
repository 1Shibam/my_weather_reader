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

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:weather_reader/themes/app_colors.dart';
// import 'package:weather_reader/themes/text_styles.dart';


// class WeatherForecastScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> forecastData;

//   const WeatherForecastScreen({super.key, required this.forecastData});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200.h,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: forecastData.length,
//         itemBuilder: (context, index) {
//           final weather = forecastData[index];
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.w),
//             child: Container(
//               width: 160.w,
//               decoration: BoxDecoration(
//                 color: AppColors.waterBlue,
//                 borderRadius: BorderRadius.circular(12.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 5.r,
//                     spreadRadius: 2.r,
//                     offset: Offset(3.w, 3.h),
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(12.w),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       weather['date'],
//                       style: AppTextStyles.heading2,
//                     ),
//                     SizedBox(height: 8.h),
//                     Icon(
//                       Icons.wb_sunny,
//                       color: AppColors.blueShade100,
//                       size: 40.sp,
//                     ),
//                     SizedBox(height: 8.h),
//                     Text(
//                       "${weather['temperature']}°C",
//                       style: AppTextStyles.bold,
//                     ),
//                     SizedBox(height: 4.h),
//                     Text(
//                       weather['description'],
//                       style: AppTextStyles.light,
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 8.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.air, color: Colors.white70, size: 18.sp),
//                         SizedBox(width: 4.w),
//                         Text(
//                           "${weather['windSpeed']} m/s",
//                           style: AppTextStyles.subtitle,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }