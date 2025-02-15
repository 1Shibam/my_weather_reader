
import 'package:my_weather_reader/core/services/weather_service.dart';
import 'package:riverpod/riverpod.dart';

final weatherServiceProvider =
    Provider<WeatherService>((ref) => WeatherService());

class WeatherServiceNotifier extends StateNotifier<AsyncValue<WeatherService>> {
  final WeatherService service;

  WeatherServiceNotifier(this.service) : super(const AsyncValue.loading()); //initial state
}
