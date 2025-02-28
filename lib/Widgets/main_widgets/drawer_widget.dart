import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_reader/Widgets/reusable_widgets/error_state_widget.dart';
import 'package:weather_reader/providers/data_providers/searched_location_history_provider.dart';

import 'package:weather_reader/providers/preference_providers/weather_animation_preference_provider.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

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
              onTap: () => context.push('/about'),
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
                activeColor: AppColors.waterBlue,
                value: ref.watch(weatherAnimationStateProvider),
                onChanged: (value) {
                  ref
                      .read(weatherAnimationStateProvider.notifier)
                      .setAnimationState(value);
                }),
          ),
          Consumer(builder: (context, ref, child) {
            final searchedData = ref.watch(searchLocationNotifierProvider);
            return searchedData.when(
                data: (data) {
                  return ExpansionTile(
                    initiallyExpanded: true,
                    iconColor: AppColors.darkBlue,
                    title: Text(
                      'History',
                      style: AppTextStyles.heading1
                          .copyWith(color: Colors.black87),
                    ),
                    children: [
                      SizedBox(height: 10.h),
                      data.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Center(
                                child: Text(
                                  'There is no search data yet!',
                                  style: AppTextStyles.regular
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 200.h, // Set a reasonable height
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics:
                                    const NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final singleData = data[index];
                                  return ListTile(
                                    title: Text(singleData.cityName),
                                  );
                                },
                              ),
                            ),
                      SizedBox(height: 10.h),
                    ],
                  );
                },
                error: (error, stackTrace) => const ErrorStateWidget(),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ));
          })
        ],
      ),
    );
  }
}
