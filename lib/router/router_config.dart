import 'package:go_router/go_router.dart';
import 'package:my_weather_reader/screens/about_page.dart';
import 'package:my_weather_reader/screens/weather_home_screen.dart';

GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const WeatherHomeScreen();
    },
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) {
      return const WeatherHomeScreen();
    },
  ),
  GoRoute(
    path: '/about',
    builder: (context, state) {
      return const AboutPage();
    },
  ),
]);
