import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_reader/Widgets/main_widgets/app_bar_widget.dart';
import 'package:weather_reader/Widgets/main_widgets/drawer_widget.dart';
import 'package:weather_reader/providers/data_providers/weather_forecast_provider.dart';
import 'package:weather_reader/providers/data_providers/weather_service_provider.dart';
import 'package:weather_reader/screens/current_weather_page.dart';
import 'package:weather_reader/screens/search_screen.dart';
import 'package:weather_reader/screens/weather_forecast_screen.dart';
import 'package:weather_reader/themes/app_colors.dart';
import 'package:weather_reader/themes/text_styles.dart';

class WeatherHomeScreen extends ConsumerStatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends ConsumerState<WeatherHomeScreen> {
  int _selectPage = 0;
  void onItemTapped(int index) {
    setState(() {
      _selectPage = index;
    });
  }

  final List<Widget> pages = [
    const CurrentWeatherPage(),
    const WeatherForecastScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Forecast'),
          ],
          currentIndex: _selectPage,
          onTap: (value) {
            onItemTapped(value);
          },
          backgroundColor: const Color.fromARGB(255, 0, 68, 225),
          elevation: 10,
          selectedItemColor: Colors.white,
          selectedLabelStyle: AppTextStyles.regular,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: AppTextStyles.subtitle,
        ),
        resizeToAvoidBottomInset: true,
        appBar: AppBarWidget(
          onRefresh: () {
            ref
                .read(weatherServiceNotifierProvider.notifier)
                .initializeWeatherStates();
            ref.read(searchQueryProvider.notifier).state = '';
            ref.invalidate(weatherForecastProvider);
          },
        ),
        drawer: const DrawerWidget(),
        backgroundColor: AppColors.darkBlue,
        body: pages[_selectPage]);
  }
}
