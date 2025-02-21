import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
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