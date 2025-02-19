import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:my_weather_reader/themes/app_colors.dart';

import 'package:my_weather_reader/themes/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) context.go('/home'); 
    });

    return Scaffold(
      backgroundColor: AppColors.darkBlue, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "L O A D I N G ",
              style: AppTextStyles.heading1
            ),
          ],
        ),
      ),
    );
  }
}
