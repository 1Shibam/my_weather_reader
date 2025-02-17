import 'package:my_weather_reader/core/services/weather_service.dart';
import 'package:my_weather_reader/models/weather_data.dart';
import 'package:riverpod/riverpod.dart';



class WeatherServiceNotifier extends StateNotifier<AsyncValue<WeatherData>> {
  final WeatherService service;

  WeatherServiceNotifier(this.service)
      : super(const AsyncValue.loading()); //initial state

  Future<void> searchLocation(String location) async {
    state = const AsyncValue.loading();
    try {
      final search = await service.searchByLocationName(location);
      state = AsyncValue.data(search);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> searchCoordinates(double latitude, double longitude) async {
    state = const AsyncValue.loading();
    try {
      final coordinateSearch =
          await service.serachByCoordinates(latitude, longitude);
      state = AsyncValue.data(coordinateSearch);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final weatherServiceProvider =
    Provider<WeatherService>((ref) => WeatherService());
final weatherServiceNotifierProvider = StateNotifierProvider<WeatherServiceNotifier, AsyncValue<WeatherData>>(
    (ref) => WeatherServiceNotifier(ref.read(weatherServiceProvider)));
