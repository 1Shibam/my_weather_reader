import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather_reader/Widgets/show_warning_dialog.dart';
import 'package:my_weather_reader/providers/show_serach_suggestion_preference.dart';
import 'package:my_weather_reader/themes/text_styles.dart';

class SuggestedLocationsText extends StatelessWidget {
  const SuggestedLocationsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => showWarningDialog(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.info_outline, color: Colors.red, size: 22.sp),
                  SizedBox(width: 6.w),
                  Text(
                    "Note",
                    style: AppTextStyles.heading2.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final value = ref.watch(searchSuggestionEnableProvider);
                return Switch(
                  activeColor: Colors.blue,
                  value: value,
                  onChanged: (currentVal) {
                    ref
                        .read(searchSuggestionEnableProvider.notifier)
                        .setSerachState(currentVal);
                  },
                );
              },
            )
          ],
        ),
        Row(
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
    );
  }
}
