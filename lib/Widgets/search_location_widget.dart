import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_weather_reader/Widgets/custom_text_filed.dart';
import 'package:my_weather_reader/screens/search_screen.dart';

final searchModeProvider = StateProvider<bool>(
    (ref) => true); // true for city search, false for coordinates

class SearchLocationWidget extends ConsumerStatefulWidget {
  const SearchLocationWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchLocationWidgetState();
}

class _SearchLocationWidgetState extends ConsumerState<SearchLocationWidget> {
  TextEditingController latController = TextEditingController();
  TextEditingController lonController = TextEditingController();
  FocusNode latFocus = FocusNode();
  FocusNode lonFocus = FocusNode();
  @override
  void dispose() {
    latController.dispose();
    lonController.dispose();
    latFocus.dispose();
    lonFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String text = ref.watch(searchQueryProvider);

    TextEditingController searchText = TextEditingController(text: text);

    final isSearchByCity = ref.watch(searchModeProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300), // Smooth transition
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: isSearchByCity
                  ? CustomTextFiled(
                      controller: searchText,
                      canRequestFocus: false,
                      key: const ValueKey(
                          'citySearch'), // Unique key for smooth transition
                      onTap: () {
                        context.push('/search');
                      },
                      hintText: 'Enter Any Location',
                      label: 'Search',
                    )
                  : Row(
                      key: const ValueKey(
                          'coordsSearch'), // Unique key for smooth transition
                      children: [
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
          ),
          SizedBox(width: 10.w),
          IconButton(
            onPressed: () {
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
