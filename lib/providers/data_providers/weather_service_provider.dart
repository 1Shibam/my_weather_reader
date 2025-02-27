import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_reader/models/weather_model.dart';
import 'package:weather_reader/providers/data_providers/geo_locator_provider.dart';
import 'package:weather_reader/providers/data_providers/weather_forecast_provider.dart';
import 'package:weather_reader/services/weather_service.dart';

class WeatherServiceNotifier extends StateNotifier<AsyncValue<WeatherModel>> {
  final WeatherService service;
  final Ref ref;

  WeatherServiceNotifier(this.service, this.ref)
      : super(const AsyncValue.loading());

  Future<void> initializeWeatherStates() async {
    state = const AsyncValue.loading();
    try {
      final position = await ref
          .read(geoNotifierStateProvider.notifier)
          .fetchCurrentLocation();
      await searchCoordinates(position.latitude, position.longitude);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> searchLocation(String location) async {
    state = const AsyncValue.loading();
    try {
      final search = await service.searchByLocationName(location);
      ref
          .read(weatherForecastProvider.notifier)
          .getWeatherForecastWithName(location);
      state = AsyncValue.data(search);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> searchCoordinates(double latitude, double longitude) async {
    state = const AsyncValue.loading();
    try {
      final coordinateSearch =
          await service.searchByCoordinates(latitude, longitude);
      ref
          .read(weatherForecastProvider.notifier)
          .getWeatherForecastWithCoordinates(latitude, longitude);
      state = AsyncValue.data(coordinateSearch);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final weatherServiceProvider =
    Provider<WeatherService>((ref) => WeatherService());

final weatherServiceNotifierProvider =
    StateNotifierProvider<WeatherServiceNotifier, AsyncValue<WeatherModel>>(
        (ref) => WeatherServiceNotifier(ref.read(weatherServiceProvider), ref));
