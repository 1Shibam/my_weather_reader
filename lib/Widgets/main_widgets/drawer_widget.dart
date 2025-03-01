import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_reader/Widgets/dialog_widget/search_location_detail_widget.dart';
import 'package:weather_reader/Widgets/main_widgets/other_weather_details_expansion_tile.dart';
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
                              height: 400.h, // Set a reasonable height
                              child: ListView.builder(
                                shrinkWrap: true,
                                // Prevents nested scrolling issues
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final singleData = data[index];
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          onTap: () =>
                                              searchLocationDetailWidget(
                                                  context, singleData),
                                          title: Text(
                                            singleData.cityName,
                                            style: AppTextStyles.heading2
                                                .copyWith(
                                                    color: Colors.black87),
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                // ignore: unnecessary_string_interpolations
                                                "${formatTime(singleData.currentTime, 0, isUtc: false)}",
                                                style: AppTextStyles.regular
                                                    .copyWith(
                                                        color: Colors.black),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              AppColors
                                                                  .waterBlue,
                                                          title: Text(
                                                            'Delete search',
                                                            style: AppTextStyles
                                                                .heading1,
                                                          ),
                                                          content: Text(
                                                            'Are you sure you want to delete this search ?',
                                                            style: AppTextStyles
                                                                .heading2,
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                                child: Text(
                                                                  'Cancel',
                                                                  style: AppTextStyles
                                                                      .heading2,
                                                                )),
                                                            GestureDetector(
                                                              onTap: () async {
                                                                await ref
                                                                    .read(searchLocationNotifierProvider
                                                                        .notifier)
                                                                    .deleteFromSearchList(
                                                                        singleData
                                                                            .weatherId!);
                                                                if (context
                                                                    .mounted) {
                                                                  Navigator.pop(
                                                                      context);
                                                                }
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .red,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.r)),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal: 10
                                                                            .r,
                                                                        vertical:
                                                                            8.r),
                                                                child: Text(
                                                                  'Delete',
                                                                  style:
                                                                      AppTextStyles
                                                                          .bold,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  icon: const Icon(Icons.clear))
                                            ],
                                          ),
                                        ),
                                        Divider(
                                            height: 1.h,
                                            thickness: 2.sp,
                                            color: AppColors.waterBlue),
                                      ],
                                    ),
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
