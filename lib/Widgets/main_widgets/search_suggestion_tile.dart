import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_reader/models/search%20suggestion%20model/search_suggestions.dart';
import 'package:weather_reader/providers/data_providers/weather_service_provider.dart';
import 'package:weather_reader/screens/search_screen.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

class SearchSuggestionTiles extends ConsumerWidget {
  const SearchSuggestionTiles({super.key, required this.locations});

  final List<SearchSuggestions> locations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final singleData = locations[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: ListTile(
            onTap: () {
              ref.read(searchQueryProvider.notifier).state =
                  singleData.displayName!;
              ref
                  .read(weatherServiceNotifierProvider.notifier)
                  .searchCoordinates(singleData.lat!, singleData.lon!);
              context.pop();
            },
            leading: const Icon(
              Icons.location_on,
              color: Colors.red,
            ),
            tileColor: AppColors.waterBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)),
            title: Text(
              locations[index].displayName!,
              style: AppTextStyles.bold,
            ),
          ),
        );
      },
    );
  }
}