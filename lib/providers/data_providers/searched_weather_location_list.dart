import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_reader/models/weather_model.dart';
import 'package:weather_reader/services/weather_database_service.dart';


class SearchedWeatherLocationList
    extends StateNotifier<List<WeatherModel>> {
  final Ref ref;
  SearchedWeatherLocationList(this.ref) : super([]) {
    loadSearchedList();
  }

  //! Load serached List

  Future<void> loadSearchedList() async {
    final searches =
        await ref.read(weatherDatabaseServiceProvider).getSearchedList();
    state = searches;
  }

  Future<void> addSearch(WeatherModel weatherData) async {
    await ref.read(weatherDatabaseServiceProvider).addSearchToDB(weatherData);
    loadSearchedList();
  }

  Future<void> deleteSearchedFromList(int id) async {
    await ref.read(weatherDatabaseServiceProvider).deletedSearchedLocation(id);
  }
}

final searchListProvider =
    StateNotifierProvider<SearchedWeatherLocationList, List<WeatherModel>>(
        (ref) => SearchedWeatherLocationList(ref));
