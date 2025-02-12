import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/custom_text_filed.dart';

final searchModeProvider = StateProvider<bool>(
    (ref) => true); // true for city search, false for coordinates

class SearchLocationWidget extends ConsumerStatefulWidget {
  const SearchLocationWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchLocationWidgetState();
}

class _SearchLocationWidgetState extends ConsumerState<SearchLocationWidget> {
  @override
  Widget build(BuildContext context) {
    final isSearchByCity = ref.watch(searchModeProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          // Use Expanded to ensure the TextField(s) take up available space
          Expanded(
            child: isSearchByCity
                ? const CustomTextFiled(
                    hintText: 'Enter Any Location', label: 'Search')
                : Row(
                    children: [
                      // Use Expanded to divide the available space equally
                      const Expanded(
                        child: CustomTextFiled(
                          hintText: '00.00',
                          label: 'Latitude',
                        ),
                      ),
                      SizedBox(width: 10.w),
                      const Expanded(
                        child: CustomTextFiled(
                          label: 'Longitude',
                          hintText: '00.00',
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(width: 10.w), // Space between the TextField and the icon
          IconButton(
            onPressed: () {
              // Toggle search mode using provider
              ref.read(searchModeProvider.notifier).state = !isSearchByCity;
            },
            icon: const Icon(
              Icons.swap_horiz,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
