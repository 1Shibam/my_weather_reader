import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_weather_reader/themes/app_colors.dart';

class DrawerWidget extends ConsumerStatefulWidget {
  const DrawerWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends ConsumerState<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightBlueShade,
      child: ListView(
        children: [
          DrawerHeader(child: Text('Menu')),
          ListTile(title: Text('Item 1')),
          ListTile(title: Text('Item 2')),
        ],
      ),
    );
  }
}
