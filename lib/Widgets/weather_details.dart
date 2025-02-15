import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDetails extends ConsumerWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Location and Temperature Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.redAccent),
                        SizedBox(width: 5.w),
                        Text(
                          "Mountain View",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.cloud,
                            color: Colors.white70, size: 18),
                        SizedBox(width: 5.w),
                        Text(
                          "Broken Clouds",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "11.92°C",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Weather Animation Container
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Text(
                  "Weather Animation Here",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Expandable Weather Details
            GestureDetector(
              onTap: () {
                // Handle expand/collapse logic
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Weather Details",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    const Icon(Icons.keyboard_arrow_down,
                        color: Colors.white, size: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
