import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:my_weather_reader/core/services/geo_locator_service.dart';
import 'package:riverpod/riverpod.dart';

//geolocator service provider
final geoLocationProvider =
    Provider<GeoLocatorService>((ref) => GeoLocatorService());

class GeoNotifer extends AsyncNotifier<Position> {
  late final GeoLocatorService geoService;

  @override
  FutureOr<Position> build() async {
    geoService = ref.watch(geoLocationProvider);
    return fetchCurrentLocation(); //initial state
  }

  Future<Position> fetchCurrentLocation() async {
    state = const AsyncValue.loading();
    try {
      final currPosition = await geoService.determinePosition();
      state = AsyncValue.data(currPosition);
      return currPosition;
    } catch (err, stackTrace) {
      state = AsyncValue.error(err, stackTrace);
      rethrow;
    }
  }
}

//GeoNotifier provider
final geoNotifierStateProvider =
    AsyncNotifierProvider<GeoNotifer, Position>(() => GeoNotifer());
