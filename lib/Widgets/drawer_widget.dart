import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:my_weather_reader/providers/weather_animation_provider.dart';
import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class DrawerWidget extends ConsumerStatefulWidget {
  const DrawerWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends ConsumerState<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightBlueShade,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: DrawerHeader(
                child: Text(
              'Menu',
              style: AppTextStyles.heading1
                  .copyWith(color: Colors.black, fontSize: 40.sp),
            )),
          ),
          ListTile(
              onTap: () => context.go('/about'),
              title: Text(
                'About',
                style: AppTextStyles.heading1.copyWith(color: Colors.black87),
              )),
          ListTile(
            title: Text(
              'Weather GIF',
              style: AppTextStyles.heading1.copyWith(color: Colors.black87),
            ),
            trailing: Switch(
                value: ref.watch(weatherAnimationStateProvider),
                onChanged: (value) {
                  ref
                      .read(weatherAnimationStateProvider.notifier)
                      .setAnimationState(value);
                }),
          ),
          ExpansionTile(
            initiallyExpanded: true,
            iconColor: AppColors.darkBlue,
            title: Text(
              'History',
              style: AppTextStyles.heading1.copyWith(color: Colors.black87),
            ),
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Text(
                  'There is no Search data yet!!',
                  style: AppTextStyles.regular.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
