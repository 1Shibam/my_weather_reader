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

  void onSearchChanged(String query) {}
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
                hintText: 'Enter the name',
                label: '',
                controller: searchController,
                onChanged: onSearchChanged,
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
              child: Consumer(
                builder: (context, ref, child) {
                  final suggestions = ref.watch(searchSuggestionsProvider);
                  return ListView.builder(
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          suggestions[index].displayName!,
                          style: AppTextStyles.heading2,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
