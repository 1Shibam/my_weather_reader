import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_reader/models/forecast_model/forecast_model.dart';
import 'package:weather_reader/services/weather_service.dart';

class WeatherForecastNotifier extends StateNotifier<AsyncValue<ForecastModel>> {
  final WeatherService service;
  final Ref ref;
  WeatherForecastNotifier(this.service, this.ref)
      : super(const AsyncValue.loading());

  Future<void> getWeatherForecastWithName(String location) async {
    state = const AsyncValue.loading();
    try {
      final search = await service.getWeatherForecastWithName(location);
      state = AsyncValue.data(search);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> getWeatherForecastWithCoordinates(
      double latitude, double longitude) async {
    try {
      final search =
          await service.getWeatherForecastUsingCoordinates(latitude, longitude);
      state = AsyncValue.data(search);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
