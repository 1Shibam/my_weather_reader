import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                ? const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      hintText: 'Enter city name',
                    ),
                  )
                : Row(
                    children: [
                      // Use Expanded to divide the available space equally
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            hintText: 'Latitude',
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            hintText: 'Longitude',
                          ),
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
            icon: const Icon(Icons.swap_horiz),
          ),
        ],
      ),
    );
  }
}