import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onRefresh;
  const AppBarWidget({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: AppColors.darkBlue,
      centerTitle: true,
      title: Text(
        'Weather-Reader',
        style: AppTextStyles.heading1,
      ),
      actions: [
        IconButton(
            onPressed: onRefresh,
            icon: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 32.sp,
              ),
            ))
      ],
      leading: Builder(
        builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Icon(
                  Icons.menu_sharp,
                  color: Colors.white,
                  size: 32.sp,
                ),
              ));
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}