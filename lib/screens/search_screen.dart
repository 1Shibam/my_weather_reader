import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_reader/Widgets/reusable_widgets/custom_text_filed.dart';
import 'package:weather_reader/Widgets/reusable_widgets/popular_locations_text.dart';
import 'package:weather_reader/Widgets/reusable_widgets/shimmer_loading.dart';
import 'package:weather_reader/Widgets/reusable_widgets/suggested_location_text.dart';
import 'package:weather_reader/Widgets/dialog_widget/warning_and_suggestion_switch.dart';


import 'package:weather_reader/providers/data_providers/search_suggestions_provider.dart';

import 'package:weather_reader/providers/data_providers/weather_service_provider.dart';
import 'package:weather_reader/providers/preference_providers/show_serach_suggestion_preference.dart';

import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  void onSearchChanged(String query, WidgetRef ref) {
    ref.read(searchQueryProvider.notifier).state = query;
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    if (query.trim().isNotEmpty) {
      ref.read(searchQueryProvider.notifier).state = query;
      _debounce = Timer(const Duration(milliseconds: 300), () {
        ref.read(searchSuggestionsProvider.notifier).fetchSuggestions(query);
      });
    } else {
      ref.read(searchSuggestionsProvider.notifier).fetchSuggestions(query);
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);
    final showSuggestions = ref.watch(searchSuggestionEnableProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkBlue,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
              ),
              padding: EdgeInsets.only(bottom: 10.h),
              color: AppColors.darkBlue,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Consumer(
                          builder: (context, ref, child) {
                            return CustomTextFiled(
                              autoFocus: true,
                              hintText: 'Search Location',
                              label: 'Search Location',
                              controller: searchController,
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        searchController.clear();

                                        onSearchChanged('', ref);
                                      },
                                      icon: Icon(
                                        Icons.clear,
                                        color: Colors.white,
                                        size: 28.sp,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        ref
                                            .read(weatherServiceNotifierProvider
                                                .notifier)
                                            .searchLocation(
                                                searchController.text.trim());

                                        context.pop();
                                      },
                                      icon: Icon(
                                        Icons.search_rounded,
                                        color: Colors.white,
                                        size: 28.sp,
                                      )),
                                ],
                              ),
                              onChanged: (value) {
                                onSearchChanged(value.trim(), ref);
                              },
                            );
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                            size: 40.sp,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const WarningAndSuggestionSwitch(),
                  showSuggestions
                      ? Column(
                          children: [
                            SizedBox(
                              height: 4.h,
                            ),
                            searchQuery.trim().isEmpty
                                ? const PopularLocationsText()
                                : const SuggestedLocationsText(),
                          ],
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
            showSuggestions
                ? Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                final suggestions =
                                    ref.watch(searchSuggestionsProvider);
                                return suggestions.when(
                                    data: (locations) {
                                      return locations.isEmpty
                                          ? Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                'Opps no matches! please be more specific!',
                                                style: AppTextStyles.heading1,
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: locations.length,
                                              itemBuilder: (context, index) {
                                                final singleData =
                                                    locations[index];
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4.h),
                                                  child: ListTile(
                                                    onTap: () {
                                                      ref
                                                              .read(
                                                                  searchQueryProvider
                                                                      .notifier)
                                                              .state =
                                                          singleData
                                                              .displayName!;
                                                      ref
                                                          .read(
                                                              weatherServiceNotifierProvider
                                                                  .notifier)
                                                          .searchCoordinates(
                                                              singleData.lat!,
                                                              singleData.lon!);
                                                      context.pop();
                                                    },
                                                    leading: const Icon(
                                                      Icons.location_on,
                                                      color: Colors.red,
                                                    ),
                                                    tileColor:
                                                        AppColors.waterBlue,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.r)),
                                                    title: Text(
                                                      locations[index]
                                                          .displayName!,
                                                      style: AppTextStyles.bold,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                    },
                                    error: (err, stackTrace) {
                                      return Center(
                                          child: Image.asset(
                                              'assets/animations/ERROR-OCCURED.png'));
                                    },
                                    loading: () => const ShimmerLoading());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: SizedBox(
                      child: Text(
                        'Suggestion are Turned off',
                        style: AppTextStyles.heading2,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
