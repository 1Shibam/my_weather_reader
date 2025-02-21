import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/themes/theme.dart';

import 'router/router_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure async services initialize

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // Ensure async services initialize
//   final container = ProviderContainer();

//   // Wait for the location and weather data to load before app starts
//   await container
//       .read(weatherServiceNotifierProvider.notifier)
//       .initializeWeatherStates();

//   runApp(
//     UncontrolledProviderScope(
//       container: container,
//       child: const MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: appThemeData);
      },
    );
  }
}
