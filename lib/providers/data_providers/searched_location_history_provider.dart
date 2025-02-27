import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_reader/models/weather_model.dart';
import 'package:weather_reader/services/weather_database_service.dart';

class SearchedListNotifier
    extends StateNotifier<AsyncValue<List<WeatherModel>>> {
  final Ref ref;
  SearchedListNotifier(this.ref) : super(const AsyncValue.loading()) {
    initializeSearchList();
  }
  Future<void> initializeSearchList() async {
    state = const AsyncValue.loading();
    try {
      final service = await ref.read(weatherDatabaseServiceProvider.future);
      final locations = await service.getSearchedList();
      state = AsyncValue.data(locations);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addSearchToList(WeatherModel weatherData) async {
    try {
      state = const AsyncValue.loading();
      final service = await ref.read(weatherDatabaseServiceProvider.future);
      await service.addSearchToDB(weatherData);
      final updatedLocations = await service.getSearchedList();
      state = AsyncValue.data(updatedLocations);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteFromSearchList(int id) async {
    try {
      state = const AsyncValue.loading();
      final service = await ref.read(weatherDatabaseServiceProvider.future);
      await service.deletedSearchedLocation(id);
      final updatedLocations = await service.getSearchedList();
      state = AsyncValue.data(updatedLocations);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final searchLocationNotifierProvider =
    StateNotifierProvider<SearchedListNotifier, AsyncValue<List<WeatherModel>>>(
        (ref) {
  return SearchedListNotifier(ref);
});
