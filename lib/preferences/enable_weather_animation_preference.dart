import 'package:shared_preferences/shared_preferences.dart';

Future<void> enableWeatherAnimation(bool val) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isAnimationEnabled', val);
}
