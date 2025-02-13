import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/custom_text_filed.dart';
import 'package:my_weather_reader/providers/search_suggestions_provider.dart';
import 'package:my_weather_reader/themes/app_colors.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  void onSearchChanged(String query, WidgetRef ref) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    if (query.isNotEmpty) {
      _debounce = Timer(const Duration(milliseconds: 600), () {
        ref.read(searchSuggestionsProvider.notifier).fetchSuggestions(query);
        print(query);
      });
    } else {
      ref.read(searchSuggestionsProvider.notifier).fetchSuggestions(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlueShade,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Consumer(
            builder: (context, ref, child) {
              return CustomTextFiled(
                autoFocus: true,
                hintText: 'Enter the name',
                label: '',
                controller: searchController,
                onChanged: (value) {
                  onSearchChanged(value, ref);
                },
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.skyBlue,
                  borderRadius: BorderRadius.circular(20.r)),
              padding: EdgeInsets.all(20.w),
              child: Column(
                
                children: [
                  if (searchController.text.trim().isEmpty)
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Text(
                        'Suggested Locations',
                        style: AppTextStyles.heading1,
                      ),
                    ),
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) {
                        final suggestions = ref.watch(searchSuggestionsProvider);
                        return suggestions.when(
                            data: (locations) {
                              return ListView.builder(
                                itemCount: locations.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(locations[index].displayName!),
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
                            loading: () => const Center(
                                  child: CircularProgressIndicator(),
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
    );
  }
}
