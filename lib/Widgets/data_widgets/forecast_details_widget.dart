import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/themes/text_styles.dart';

class ForecastDetailsWidget extends ConsumerStatefulWidget {
  const ForecastDetailsWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForecastDetailsWidgetState();
}

class _ForecastDetailsWidgetState extends ConsumerState<ForecastDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.location_on, color: Colors.red, size: 40.w,)
        ],
      ),
    );
  }
}
