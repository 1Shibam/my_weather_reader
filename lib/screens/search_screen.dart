import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/custom_text_filed.dart';
import 'package:my_weather_reader/providers/search_suggestions_provider.dart';
import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';
import 'package:shimmer/shimmer.dart';

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
                  Consumer(
                    builder: (context, ref, child) {
                      return CustomTextFiled(
                        autoFocus: true,
                        hintText: 'Enter Location',
                        label: '',
                        controller: searchController,
                        onChanged: (value) {
                          onSearchChanged(value.trim(), ref);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  searchQuery.trim().isEmpty
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Popular Locations',
                              style: AppTextStyles.heading1,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40.spMax,
                            )
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Suggested Location',
                              style: AppTextStyles.heading1,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40.spMax,
                            )
                          ],
                        ),
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
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4.h),
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.location_on,
                                          color: Colors.red,
                                        ),
                                        tileColor: AppColors.waterBlue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r)),
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
                                  child: Text(
                                    'Something went wrong!!',
                                    style: AppTextStyles.heading1,
                                  ),
                                );
                              },
                              loading: () => Shimmer.fromColors(
                                    baseColor: Colors.blueGrey[300]!,
                                    highlightColor: Colors.blueGrey[100]!,
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 16.h),
                                        child: Column(
                                          children: List.generate(
                                            10, // Limit to 5 shimmer items to avoid overflow
                                            (index) => _buildShimmerItem(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
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

Widget _buildShimmerItem() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      height: 50.h, // Fixed height for shimmer item
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 234, 234).withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.r),
      ),
    ),
  );
}
