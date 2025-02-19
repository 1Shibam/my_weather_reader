import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherAnimationNotifier extends StateNotifier<bool> {
  WeatherAnimationNotifier() : super(true) {
    loadAnimationState();
  }
  Future<void> loadAnimationState() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('isAnimationEnabled') ?? true;
  }

  Future<void> setAnimationState(bool value) async {
    state = value;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isAnimationEnabled', value);
  }
}

final weatherAnimationStateProvider =
    StateNotifierProvider<WeatherAnimationNotifier, bool>(
        (ref) => WeatherAnimationNotifier());
