import 'package:my_weather_reader/providers/geo_locator_provider.dart';
import 'package:my_weather_reader/services/weather_service.dart';
import 'package:my_weather_reader/models/weather_data.dart';
import 'package:riverpod/riverpod.dart';

class WeatherServiceNotifier
    extends StateNotifier<AsyncValue<WeatherDataModel>> {
  final WeatherService service;
  final Ref ref;

  WeatherServiceNotifier(this.service, this.ref)
      : super(const AsyncValue.loading()) {
    initializeWeatherStates();
  } //initial state

  Future<void> initializeWeatherStates() async {
    final position = await ref
        .read(geoNotifierStateProvider.notifier)
        .fetchCurrentLocation();
    // do location when state if caught error show the database state and if search show the searched state!!
  }

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
final weatherServiceNotifierProvider =
    StateNotifierProvider<WeatherServiceNotifier, AsyncValue<WeatherDataModel>>(
        (ref) => WeatherServiceNotifier(ref.read(weatherServiceProvider)));
