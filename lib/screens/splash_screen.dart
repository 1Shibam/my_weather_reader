import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

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
            Image.asset('assets/animations/final loading.gif'),
            SizedBox(height: 16.h,),
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
