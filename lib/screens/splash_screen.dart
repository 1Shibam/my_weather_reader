import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:my_weather_reader/themes/app_colors.dart';

import 'package:my_weather_reader/themes/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      final bool whereToGo = await getOnBoardingPreference();
      if (context.mounted) {
        whereToGo ? context.go('/home') : context.go('/onBoarding');
      }
    });

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("L O A D I N G ", style: AppTextStyles.heading1),
          ],
        ),
      ),
    );
  }
}

Future<bool> getOnBoardingPreference() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('hasSeenOnBoarding') ?? false;
}

Future<void> setOnBoardingPreference(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('hasSeenOnBoarding', value);
}
