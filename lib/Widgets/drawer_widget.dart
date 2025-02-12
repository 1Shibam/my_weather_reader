import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_weather_reader/main.dart';
import 'package:my_weather_reader/router/router_config.dart';
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
              const Center(
                child: Text('There is no Search data yer!!'),
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
