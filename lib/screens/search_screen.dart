import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_weather_reader/Widgets/custom_text_filed.dart';
import 'package:my_weather_reader/Widgets/popular_locations_text.dart';
import 'package:my_weather_reader/Widgets/shimmer_loading.dart';
import 'package:my_weather_reader/Widgets/suggested_location_text.dart';
import 'package:my_weather_reader/providers/search_suggestions_provider.dart';

import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

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
              padding: EdgeInsets.only(bottom: 20.h),
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
                              onChanged: (value) {
                                onSearchChanged(value.trim(), ref);
                              },
                            );
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            context.go('/home');
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 40.sp,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  searchQuery.trim().isEmpty
                      ? const PopularLocationsText()
                      : const SuggestedLocationsText(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6.h,
                    ),
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, child) {
                          final suggestions =
                              ref.watch(searchSuggestionsProvider);
                          return suggestions.when(
                              data: (locations) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: locations.length,
                                  itemBuilder: (context, index) {
                                    return locations.isEmpty
                                        ? Center(
                                            child: Text(
                                              'No results, Please be more specific!!',
                                              style: AppTextStyles.heading1,
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4.h),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.location_on,
                                                color: Colors.red,
                                              ),
                                              tileColor: AppColors.waterBlue,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.r)),
                                              title: Text(
                                                locations[index].displayName!,
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
          ],
        ),
      ),
    );
  }
}
