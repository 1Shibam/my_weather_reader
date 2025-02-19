import 'package:my_weather_reader/providers/geo_locator_provider.dart';
import 'package:my_weather_reader/providers/searched_weather_location_list.dart';
import 'package:my_weather_reader/services/weather_service.dart';
import 'package:my_weather_reader/models/weather%20model/weather_data.dart';
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
    try {
      final position = await ref.read(geoNotifierStateProvider.future);
      await searchCoordinates(position.latitude, position.longitude);
    } catch (error, stackTrace) {
      final searchList = ref.read(searchListProvider);
      if (searchList.isNotEmpty) {
        await searchLocation(searchList.last.cityName);
      } else {
        state = AsyncValue.error(error, stackTrace);
      }
    }
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
          await service.searchByCoordinates(latitude, longitude);
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
        (ref) => WeatherServiceNotifier(ref.read(weatherServiceProvider), ref));
