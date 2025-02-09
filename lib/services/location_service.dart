import 'package:geolocator/geolocator.dart';
import 'package:riverpod/riverpod.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}



class LocationServiceNotifier extends StateNotifier<AsyncValue<Position>> {
  LocationServiceNotifier() : super(const AsyncValue.loading()) {
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      state = const AsyncValue.loading();

      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      // Check & request location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // If permissions are granted, get the position
      final position = await Geolocator.getCurrentPosition();
      state = AsyncValue.data(position);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final locationProvider = StateNotifierProvider<LocationServiceNotifier, AsyncValue<Position>>(
  (ref) => LocationServiceNotifier(),
);
